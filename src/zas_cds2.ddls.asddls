@AbapCatalog.sqlViewName: 'ZAS_CDS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds örnek 1'
define view zas_dll2
  as select from ekko
    inner join   ekpo on ekko.ebeln = ekpo.ebeln
    inner join   lfa1 on ekko.lifnr = lfa1.lifnr
    inner join   mara on ekpo.matnr = mara.matnr
    inner join   makt on mara.matnr = makt.matnr
                     and makt.spras = $session.system_language

{
  ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.name1,
  cast( concat ( lfa1.stras, lfa1.mcod3 )as abap.char( 255 )) as zsatici

}
