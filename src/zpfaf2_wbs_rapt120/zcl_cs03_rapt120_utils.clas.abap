CLASS zcl_cs03_rapt120_utils DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS clear_draft_table
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs03_rapt120_utils IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    clear_draft_table(  out ).

  ENDMETHOD.


  METHOD clear_draft_table.

    out->write( 'start delete from zcs03_cstmr000_d' ).
    delete from zcs03_cstmr000_d.
    out->write( 'start delete from zcs03_sttistic_d' ).
    delete from zcs03_sttistic_d.
    out->write( '...done' ).


  ENDMETHOD.

ENDCLASS.
