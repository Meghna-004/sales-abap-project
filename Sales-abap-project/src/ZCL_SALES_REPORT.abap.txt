CLASS zcl_sales_report DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_sales_report IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_sales,
             sales_id      TYPE i,
             customer_name TYPE string,
             product_name  TYPE string,
             region        TYPE string,
             sales_type    TYPE string,
             quantity      TYPE i,
             price         TYPE p LENGTH 15 DECIMALS 2,
             total_amount  TYPE p LENGTH 15 DECIMALS 2,
             discount      TYPE p LENGTH 15 DECIMALS 2,
             net_amount    TYPE p LENGTH 15 DECIMALS 2,
           END OF ty_sales.

    DATA: lt_sales TYPE STANDARD TABLE OF ty_sales,
          ls_sales TYPE ty_sales,
          lv_total TYPE p LENGTH 15 DECIMALS 2 VALUE 0.

    SELECT sales_id,
           customer_name,
           product_name,
           region,
           sales_type,
           quantity,
           price
      FROM zc_sales
      INTO TABLE @DATA(lt_raw)
      UP TO 50 ROWS.

    LOOP AT lt_raw INTO DATA(ls_raw).

      ls_sales = CORRESPONDING ty_sales( ls_raw ).

      " Business calculations
      ls_sales-total_amount = ls_sales-quantity * ls_sales-price.
      ls_sales-discount     = ls_sales-total_amount * 10 / 100.
      ls_sales-net_amount   = ls_sales-total_amount - ls_sales-discount.

      " Grand total
      lv_total = lv_total + ls_sales-net_amount.

      APPEND ls_sales TO lt_sales.

    ENDLOOP.

    SORT lt_sales BY net_amount DESCENDING.

    "-----------------------------
    " Output
    "-----------------------------
    out->write( '================ SALES REPORT ================' ).
    out->write( 'ID | CUSTOMER | PRODUCT | REGION | NET AMOUNT' ).
    out->write( '---------------------------------------------' ).

    LOOP AT lt_sales INTO ls_sales.

      out->write(
         |{ ls_sales-sales_id WIDTH = 5 } { ls_sales-customer_name WIDTH = 10 } { ls_sales-product_name WIDTH = 12 } { ls_sales-region WIDTH = 8 } { ls_sales-net_amount }|
      ).

    ENDLOOP.

    out->write( '---------------------------------------------' ).
    out->write( |Total Records: { lines( lt_sales ) }| ).
    out->write( |Grand Total Sales: { lv_total }| ).

  ENDMETHOD.

ENDCLASS.