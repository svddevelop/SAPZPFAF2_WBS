CLASS lhc_zr_cs03_customers001 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrCs03Customers001
        RESULT result,
      ShowStat FOR MODIFY
        IMPORTING keys FOR ACTION ZrCs03Customers001~ShowStat RESULT result.


    TYPES mt_jahr TYPE c LENGTH 4.
    " Referenz zur Statistikklasse
*    DATA lo_stat TYPE REF TO zcl_cs3_statistic001.
    METHODS create_dynamic
      IMPORTING
                iv_customerid      TYPE zde_bid OPTIONAL
                iv_jahr            TYPE mt_jahr OPTIONAL
      RETURNING VALUE(rv_instance) TYPE REF TO zif_statistics03_r.

ENDCLASS.

CLASS lhc_zr_cs03_customers001 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ShowStat.
    DATA: lo_statistics TYPE REF TO zif_statistics03_r,
          lv_avg_sales  TYPE zaverage_sales03,
          lv_max_sales  TYPE zmax_sales03,
          lv_day_sales  TYPE zday_sales03.


    READ ENTITIES OF zr_cs03_customers001 IN LOCAL MODE
    ENTITY ZrCs03Customers001
    FIELDS ( Customerid )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_customers).

*    LOOP AT lt_customers INTO DATA(ls_customer).

    LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).

      DATA lv_report_str1 TYPE string.
      DATA lv_report_str2 TYPE string.
      DATA lv_jahr TYPE c LENGTH 4.       "Ermittlung aktuelles Jahr


      CLEAR lv_report_str1.
      CLEAR lv_report_str2.

*        lv_jahr = cl_abap_context_info=>get_system_date(  )(4).
      lv_jahr = sy-datum(4).      "Key Value Tabelle später anlegen

      lv_report_str1 = <fs_customer>-Customerid && ' ' && <fs_customer>-Company && ' '.

      lo_statistics = create_dynamic( iv_customerid = <fs_customer>-Customerid
                                      iv_jahr = lv_jahr ).     "  Änderung notwendig

      IF lo_statistics IS NOT INITIAL.

        lv_avg_sales = lo_statistics->averagesales( iv_customerid = <fs_customer>-Customerid
                                                     iv_jahr = lv_jahr ).            "hier noch Änderung evtl.

        lv_max_sales = lo_statistics->maxsales( iv_customerid = <fs_customer>-Customerid  ).

        lv_day_sales = lo_statistics->daysales(  iv_jahr = lv_jahr ).     " hier noch evtl. Änderung notwendig

        lv_report_str1 = lv_report_str1 && ` Average Sales: ` && lv_avg_sales    "Ausgabe
                                     && ` MaxSales: ` && lv_max_sales.

        lv_report_str2 = ` DaySales: ` && lv_day_sales.
      ELSE.
        lv_report_str1 = 'Fehler: Klasse existiert nicht!'.
      ENDIF.


*      IF lv_check_email = abap_false.
      DATA(lv_message) = me->new_message(
                            id = 'ZCX_CS03_MESSAGE_03'
                            number = '004'
                            severity = ms-information
                            v1 = lv_report_str1
                            v2 = lv_report_str2  ).

*        DATA record_failed LIKE LINE OF failed-customers.
*        record_failed-%tky = ls_customer-%tky.
*        APPEND record_failed TO failed-customers.

      DATA record_reported LIKE LINE OF reported-zrcs03customers001.
      record_reported-%tky = <fs_customer>-%tky.
      record_reported-%msg = lv_message.
      "record_reported-%element-email = if_abap_behv=>mk-on.
      APPEND record_reported TO reported-zrcs03customers001.

*
*      ENDIF.


    ENDLOOP.


    ENDMETHOD.

    METHOD create_dynamic.

      DATA ls_stat TYPE zcs03_statistic.
      SELECT SINGLE
      FROM zcs03_statistic AS st
      FIELDS *
      WHERE st~active = @abap_true
      INTO @ls_stat.

        TRANSLATE ls_stat-class TO UPPER CASE.

        TRY.
            CREATE OBJECT rv_instance TYPE (ls_stat-class).

            rv_instance->set_attributes( io_interface = rv_instance
                                                iv_customer = iv_customerid
                                                iv_jahr = iv_jahr ).

          CATCH cx_root.
        ENDTRY.

      ENDMETHOD.

ENDCLASS.
