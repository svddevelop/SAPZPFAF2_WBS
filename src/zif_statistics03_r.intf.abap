INTERFACE zif_statistics03_r
  PUBLIC .

  TYPES mt_jahr TYPE c LENGTH 4.

  DATA: mv_ndays     TYPE i.   " Anzahl Tage seit Jahresanfang, wird im constructor berechnet

  METHODS:
    AverageSales
      IMPORTING
                iv_customerid          TYPE zde_bid
                iv_jahr                TYPE mt_jahr
      RETURNING VALUE(rv_averagesales) TYPE zorder_total03,
    MaxSales
      IMPORTING
                iv_customerid      TYPE zde_bid
*                iv_jahr            TYPE mt_jahr  " über ALLE Jahre
      RETURNING VALUE(rv_maxsales) TYPE zorder_total03,
    DaySales
      IMPORTING
*                iv_customerid      TYPE zcustomerid03  " für ALLE Kunden
                iv_jahr            TYPE mt_jahr
      RETURNING VALUE(rv_daysales) TYPE zorder_total03.

    METHODS set_attributes
      IMPORTING
        io_interface TYPE REF TO zif_statistics03_r
        iv_customer  TYPE zde_bid
        iv_jahr      TYPE mt_jahr.


  CLASS-METHODS get_instance
    IMPORTING
              iv_customerid      TYPE zde_bid OPTIONAL
              iv_jahr            TYPE mt_jahr OPTIONAL
    RETURNING VALUE(rv_instance) TYPE REF TO zif_statistics03_r.
ENDINTERFACE.
