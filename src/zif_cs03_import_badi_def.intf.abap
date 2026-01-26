INTERFACE zif_cs03_import_badi_def
  PUBLIC .


  INTERFACES if_badi_interface .

  METHODS: get_protocol
    IMPORTING
      iv_type   TYPE i   " übergebener Typ, welche Protokolle es für uns braucht
                         " 0 - alle Protokolle
                         " 1 - nur Fehlerhafte protokolle
      iv_io_out TYPE REF TO if_oo_adt_classrun_out   " user call interface für Output

    .



ENDINTERFACE.
