@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZCS03_STATISTIC'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS03_STATISTIC
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_CS03_STATISTIC
  association [1..1] to ZR_CS03_STATISTIC as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Interface,
  Class,
  Active,
  @Semantics: {
    User.Createdby: true
  }
  Localcreatedby,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Localcreatedat,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  Locallastchangedby,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Locallastchangedat,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  Lastchangedat,
  _BaseEntity
}
