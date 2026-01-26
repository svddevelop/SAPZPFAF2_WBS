@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS03_CUSTOMERS000'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS03_CUSTOMERS002
  provider contract transactional_query
  as projection on ZR_CS03_CUSTOMERS001
  association [1..1] to ZR_CS03_CUSTOMERS001 as _BaseEntity on $projection.Customerid = _BaseEntity.Customerid
{
  key Customerid,
  Salutation,
  LastName,
  FirstName,
  Company,
  Street,
  City,
  Country,
  Postcode,
  LastDate,
  @Semantics: {
    amount.currencyCode: 'Currency'
  }
  SalesVolume,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Currency,
  Language, 

  
  
  @Semantics: {
    user.createdBy: true
  }
  Localcreatedby,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  Localcreatedat,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  Locallastchangedby,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  Locallastchangedat,
  _BaseEntity
}
