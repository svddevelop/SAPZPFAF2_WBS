CLASS lhc_zrcs03customers001 DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZrCs03Customers001 RESULT result.

    METHODS CustomerId FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZrCs03Customers001~CustomerId.

    "https://www.cadaxo.com/uncategorized/abap-restful-fiori-elements-buttons-in-list-reports/
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZrCs03Customers001 RESULT result.

    METHODS ShowStat1 FOR MODIFY
      IMPORTING keys FOR ACTION ZrCs03Customers001~ShowStat1 RESULT result.

    METHODS ShowStat2 FOR MODIFY
      IMPORTING keys FOR ACTION ZrCs03Customers001~ShowStat2 RESULT result.

ENDCLASS.

CLASS lhc_zrcs03customers001 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD CustomerId.
    zcl_cs03_utilsfunc=>append_text_to_statisctic_tbl( 'cutomerID' ).
  ENDMETHOD.


  METHOD get_instance_features.
    "zcl_cs03_utilsfunc=>append_text_to_statisctic_tbl( 'get_istance_feat' ).

    DATA: l_result  LIKE LINE OF result.

    READ ENTITIES OF zr_cs03_customers001 IN LOCAL MODE ENTITY ZrCs03Customers001
    FIELDS ( Customerid ) WITH CORRESPONDING #( keys )
    RESULT DATA(customers)
    FAILED failed.

    LOOP AT customers ASSIGNING FIELD-SYMBOL(<customer>).
        l_result-%action-ShowStat1 = 9.
    ENDLOOP.

    append l_result to result.


  ENDMETHOD.

  METHOD ShowStat1.
    "zcl_cs03_utilsfunc=>append_text_to_statisctic_tbl( 'ShowStat1' ).

    READ ENTITIES OF zr_cs03_customers001
    IN LOCAL MODE
    ENTITY ZrCs03Customers001
    FROM VALUE #( FOR key IN keys ( %key = key-%key ) )
    RESULT DATA(lt_customers).

    " Возвращаем те же инстанции в result (это обязательно из-за result[1] $self)
    result = VALUE #( FOR customer IN lt_customers
                    ( %tky = customer-%tky
                      %param = customer ) ).
  ENDMETHOD.

  METHOD ShowStat2.
    "zcl_cs03_utilsfunc=>append_text_to_statisctic_tbl( 'ShowStat2' ).

    "https://www.cadaxo.com/uncategorized/abap-restful-fiori-elements-buttons-in-list-reports/

    READ ENTITIES OF zr_cs03_customers001
    IN LOCAL MODE
    ENTITY ZrCs03Customers001
    FROM VALUE #( FOR key IN keys ( %key = key-%key ) )
    RESULT DATA(lt_customers).

    " Возвращаем те же инстанции в result (это обязательно из-за result[1] $self)
    result = VALUE #( FOR customer IN lt_customers
                    ( %tky = customer-%tky
                      %param = customer ) ).
  ENDMETHOD.

ENDCLASS.
