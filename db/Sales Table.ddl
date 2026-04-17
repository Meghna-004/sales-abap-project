@EndUserText.label : 'Sales Master Data Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zsales {

  key client    : abap.clnt not null;
  key sales_id  : abap.int4 not null;
  customer_name : abap.char(20);
  product_name  : abap.char(20);
  region        : abap.char(20);
  sales_type    : abap.char(10);
  quantity      : abap.int4;
  price         : abap.dec(15,2);

}