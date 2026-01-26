CLASS zcl_cs03_utilsfunc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    CLASS-METHODS append_text_to_statisctic_tbl
      IMPORTING iv_text TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs03_utilsfunc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    append_text_to_statisctic_tbl( 'Test from class' ).
    out->write( 'check the table' ).

  ENDMETHOD.


  METHOD append_text_to_statisctic_tbl.

    DATA: lt_msg TYPE TABLE OF zcs03_tbl_msg.

    "DELETE FROM zcs03_statistic WHERE id = 0.

    lt_msg = VALUE #(
        (
        client = sy-mandt
        msg = iv_text
        id = zcl_util=>nr_addr_next( )
        )
    ).

    INSERT zcs03_tbl_msg FROM TABLE @lt_msg.

  ENDMETHOD.

ENDCLASS.
