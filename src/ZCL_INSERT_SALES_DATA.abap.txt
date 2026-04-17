CLASS zcl_insert_sales_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_insert_sales_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zsales.

    DATA lt_sales TYPE STANDARD TABLE OF zsales.
    DATA ls_sales TYPE zsales.

    DATA lt_names TYPE STANDARD TABLE OF string.
    APPEND 'Amit' TO lt_names.
    APPEND 'Rahul' TO lt_names.
    APPEND 'Neha' TO lt_names.
    APPEND 'Priya' TO lt_names.
    APPEND 'Arjun' TO lt_names.
    APPEND 'Sneha' TO lt_names.
    APPEND 'Vikram' TO lt_names.
    APPEND 'Pooja' TO lt_names.

    DATA lt_products TYPE STANDARD TABLE OF string.
    APPEND 'Laptop' TO lt_products.
    APPEND 'Phone' TO lt_products.
    APPEND 'Tablet' TO lt_products.
    APPEND 'Monitor' TO lt_products.
    APPEND 'Keyboard' TO lt_products.

    DATA lt_regions TYPE STANDARD TABLE OF string.
    APPEND 'Asia' TO lt_regions.
    APPEND 'Europe' TO lt_regions.
    APPEND 'America' TO lt_regions.
    APPEND 'Global' TO lt_regions.

    DATA lt_types TYPE STANDARD TABLE OF string.
    APPEND 'Online' TO lt_types.
    APPEND 'Store' TO lt_types.

    DATA lv_index TYPE i.

    DO 40 TIMES.

      CLEAR ls_sales.

      lv_index = sy-index.

      ls_sales-client = sy-mandt.
      ls_sales-sales_id = lv_index.

      READ TABLE lt_names INTO ls_sales-customer_name
        INDEX ( lv_index MOD lines( lt_names ) + 1 ).

      READ TABLE lt_products INTO ls_sales-product_name
        INDEX ( lv_index MOD lines( lt_products ) + 1 ).

      READ TABLE lt_regions INTO ls_sales-region
        INDEX ( lv_index MOD lines( lt_regions ) + 1 ).

      READ TABLE lt_types INTO ls_sales-sales_type
        INDEX ( lv_index MOD lines( lt_types ) + 1 ).

      ls_sales-quantity = ( lv_index MOD 5 ) + 1.
      ls_sales-price = ( ls_sales-quantity ) * 10000.

      APPEND ls_sales TO lt_sales.

    ENDDO.

    INSERT zsales FROM TABLE @lt_sales.

    "----------------------------------
    " Output
    "----------------------------------
    out->write( |{ lines( lt_sales ) } rows inserted successfully into ZSALES| ).

  ENDMETHOD.

ENDCLASS.