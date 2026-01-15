CLASS zcl_cs03_postcode_maitenance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-METHODS append_to_table
      IMPORTING
        iv_postcode TYPE zpostcode03
        iv_city     TYPE zcity03.

    CLASS-METHODS fill_table_postcode.
ENDCLASS.



CLASS ZCL_CS03_POSTCODE_MAITENANCE IMPLEMENTATION.


  METHOD append_to_table.


    DATA ls_postcode TYPE zcs03_postcode.

    CLEAR ls_postcode.
    ls_postcode-client = sy-mandt.
    ls_postcode-postcode = iv_postcode.
    ls_postcode-city = iv_city.
    INSERT zcs03_postcode FROM @ls_postcode .

  ENDMETHOD.


  METHOD fill_table_postcode.

    DELETE FROM zcs03_postcode.

    append_to_table( iv_postcode = '22177'
                     iv_city     = 'Hamburg'
                     ).
    append_to_table( iv_postcode = '80331'
                     iv_city     = 'München'
                     ).
    append_to_table( iv_postcode = '10115'
                     iv_city     = 'Berlin'
                     ).

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    fill_table_postcode(  ).

    SELECT
    FROM zcs03_postcode
    FIELDS postcode, city
    INTO TABLE @DATA(lt_postcode).

    out->write( lt_postcode ).

  ENDMETHOD.
ENDCLASS.
