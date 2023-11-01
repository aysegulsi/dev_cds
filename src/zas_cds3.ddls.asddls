@AbapCatalog.sqlViewName: 'ZAS_CDS3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds örnek 3'
define view zas_ddl3
  as select from    vbrp
    inner join      vbrk on vbrp.vbeln = vbrk.vbeln
    inner join      mara on mara.matnr = vbrp.matnr
    left outer join vbak on vbak.vbeln = vbrp.aubel
    left outer join kna1 on vbak.kunnr = kna1.kunnr
    left outer join makt on  mara.matnr = makt.matnr
                         and makt.spras = $session.system_language

{
  key vbrp.vbeln,
  key vbrp.posnr,
      vbrp.aubel,
      vbrp.aupos,
      vbak.kunnr,
      cast( concat ( kna1.name1, kna1.name2 )as abap.char( 255 )) as kunnrAd,
      currency_conversion ( amount => vbrp.netwr, source_currency => vbrk.waerk,
      target_currency => cast('EUR' as abap.cuky),
      exchange_rate_date => vbrk.fkdat )                          as conversion_netwr,

      left(vbak.kunnr,3)                                          as left_kunnr,
      length(mara.matnr)                                          as matnr_length,

      case vbrk.fkart
      when 'FAS' then 'Peşinat talebi iptali'
      when 'FAZ' then 'Peşinat talebi'
      else 'Fatura'
      end                                                         as faturalama_turu,

      vbrk.fkdat,
      vbrk.inco2_l

}
