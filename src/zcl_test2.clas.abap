CLASS zcl_test2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

        lcl_test2=>fill_customers( out ).


  ENDMETHOD.
ENDCLASS.
