CLASS zcl_casestudy03_06status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CASESTUDY03_06STATUS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA:
        lv_status TYPE zstatus03,
        lv_status_descr TYPE zstatus_descr03.


    DATA: lt_status TYPE TABLE of zcs03_status,
          lv_message TYPE string.


          lt_status = VALUE #(
                        ( status = 'O' status_descr = 'nicht bezahlt' )
                        ( status = 'B' status_descr = 'bezahlt' )
                        ( status = 'A' status_descr = 'ausgeliefert' )
                        ( status = 'N' status_descr = 'neu' )

           ).


            INSERT zcs03_status FROM TABLE @lt_status.

    IF sy-subrc = 0.
        out->write( 'success' ).
        ENDIF.

  ENDMETHOD.
ENDCLASS.
