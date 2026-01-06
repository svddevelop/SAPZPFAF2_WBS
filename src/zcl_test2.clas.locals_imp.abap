CLASS lcl_test2 DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS fill_customers
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS lcl_test2 IMPLEMENTATION.

  METHOD fill_customers.
    out->write( 'Start generation to CUSTOMERS...' ).
    DATA lt_custom TYPE TABLE OF zcs03_customers.

    lt_custom = VALUE #(
        (
        customerid = zcl_util=>nr_addr_next(  )
        first_name = 'Customer' &&  zcl_util=>nr_addr_next(  )
         )
        (
        customerid = zcl_util=>nr_addr_next(  )
        first_name = 'Customer' &&  zcl_util=>nr_addr_next(  )
         )
        (
        customerid = zcl_util=>nr_addr_next(  )
        first_name = 'Customer' &&  zcl_util=>nr_addr_next(  )
         )
    ).
    INSERT zcs03_customers FROM TABLE @lt_custom.

    out->write( '---end generation to CUSTOMERS' ).

  ENDMETHOD.

ENDCLASS.
