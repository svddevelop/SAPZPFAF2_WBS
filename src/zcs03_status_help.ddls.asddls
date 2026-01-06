@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS03_STATUS_HELP
  as select from zcs03_status
{
  key status,
      status_descr
}
