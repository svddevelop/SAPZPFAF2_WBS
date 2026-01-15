@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Language Help'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZCS03_LANGUAGE_HELP as select from I_LanguageText
{
    key _LanguageCode.LanguageISOCode as Language,
       
    /* Associations */
    LanguageName
    
}

where I_LanguageText.Language = $session.system_language
