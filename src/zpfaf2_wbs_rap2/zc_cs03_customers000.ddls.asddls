@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'root view customers'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS03_CUSTOMERS000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_CS03_CUSTOMERS
  association [1..1] to ZR_CS03_CUSTOMERS as _BaseEntity on $projection.CUSTOMERID = _BaseEntity.CUSTOMERID
{
  @Endusertext: {
    Label: 'ID', 
    Quickinfo: 'Big ID'
  }
  key Customerid,
  @Endusertext: {
    Label: 'Salutation', 
    Quickinfo: 'salutation'
  }
  Salutation,
  @Endusertext: {
    Label: 'Last name', 
    Quickinfo: 'last name'
  }
  LastName,
  @Endusertext: {
    Label: 'First Name', 
    Quickinfo: 'First name'
  }
  FirstName,
  @Endusertext: {
    Label: 'Company', 
    Quickinfo: 'company name'
  }
  Company,
  @Endusertext: {
    Label: 'Street', 
    Quickinfo: 'Street'
  }
  Street,
  @Endusertext: {
    Label: 'city', 
    Quickinfo: 'City'
  }
  City,
  @Endusertext: {
    Label: 'Land/Region', 
    Quickinfo: 'Land/Region der Gesellschaft'
  }
  Country,
  @Endusertext: {
    Label: 'zip code', 
    Quickinfo: 'ZIP Code'
  }
  Postcode,
  @Endusertext: {
    Label: 'Last Date', 
    Quickinfo: 'last date'
  }
  LastDate,
  @Endusertext: {
    Label: 'Sales vol.', 
    Quickinfo: 'Sales volume'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  SalesVolume,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  @Endusertext: {
    Label: 'Curr.', 
    Quickinfo: 'Currency'
  }
  Currency,
  @Endusertext: {
    Label: 'Sprachenschlüssel', 
    Quickinfo: 'Sprachenschlüssel'
  }
  Language,
  @Endusertext: {
    Label: 'Angelegt von', 
    Quickinfo: 'Angelegt von Benutzer'
  }
  @Semantics: {
    User.Createdby: true
  }
  Localcreatedby,
  @Endusertext: {
    Label: 'Angelegt am', 
    Quickinfo: 'Anlegedatum/-uhrzeit'
  }
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Localcreatedat,
  @Endusertext: {
    Label: 'Geändert von', 
    Quickinfo: 'Letzte Änderung der lokalen Instanz durch Benutzer'
  }
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  Locallastchangedby,
  @Endusertext: {
    Label: 'Geändert am', 
    Quickinfo: 'Datum und Uhrzeit der letzten Änderung der lokalen Instanz'
  }
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Locallastchangedat,
  _BaseEntity
}
