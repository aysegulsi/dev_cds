@AbapCatalog.sqlViewName: 'ZAS_CDS4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds örnek 4'
define view zas_ddl4
  as select from zas_cds3
{
  vbeln,
  sum( conversion_netwr )                                                                        as toplam_net_deger,
  count(*)                                                                                       as toplam_fatura_adeti,
  division(cast( sum(conversion_netwr) as abap.curr( 10,3 ) ), cast( count(*) as abap.int1 ), 3) as Ortalama_Miktar,
  left(fkdat,4)                                                                                  as faturalama_yili,
  substring(fkdat,5,2)                                                                           as faturalama_ayi,
  substring(fkdat,7,2)                                                                           as faturalama_gunu,
  substring(inco2_l,1,3)                                                                         as Incoterm_Yeri

}
group by
  vbeln,
  kunnrad,
  fkdat,
  inco2_l
