@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'root view customers'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_CS03_CUSTOMERS
  as select from zcs03_customers
{

  key customerid         as Customerid,
      salutation         as Salutation,
      last_name          as LastName,
      first_name         as FirstName,
      company            as Company,
      street             as Street,
      city               as City,
      country            as Country,
      postcode           as Postcode,

      last_date          as LastDate,
      @Semantics.amount.currencyCode: 'Currency'
      sales_volume       as SalesVolume,
      @Consumption.valueHelpDefinition: [ {
      entity.name: 'I_CurrencyStdVH',
      entity.element: 'Currency',
      useForValidation: true
      } ]
      currency           as Currency,

      /*
      @Consumption.valueHelpDefinition: [ {
      entity.name: 'ZC_CS03_LANG_HELP',
      entity.element: 'Language',
      useForValidation: true
      } ]
      */
      language           as Language,

      @Semantics.user.createdBy: true
      localcreatedby     as Localcreatedby,
      @Semantics.systemDateTime.createdAt: true
      localcreatedat     as Localcreatedat,
      @Semantics.user.localInstanceLastChangedBy: true
      locallastchangedby as Locallastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchangedat as Locallastchangedat


}
