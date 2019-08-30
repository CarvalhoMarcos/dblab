declare
begin
for art in(
    select a.cod_art, a.tpo_art, a.nac_bras, a.nom_art
    from locadora.artistas a)
loop
    insert into LOCADORA_DW.DM_ARTISTA values(art.cod_art, art.tpo_art, art.nac_bras, art.nom_art);
    commit;
end loop;

for gra in(
    select g.cod_grav, g.uf_grav, g.nac_bras, g.nom_grav
    from locadora.gravadoras g
)
loop
    insert into LOCADORA_DW.DM_GRAVADORA values(gra.cod_grav, gra.uf_grav, gra.nac_bras, gra.nom_grav);
    commit;
end loop;

for soc in ( 
    select s.cod_soc, s.nom_soc, ts.dsc_tps
    from LOCADORA.socios s , locadora.tipos_socios ts
    where s.cod_tps = ts.cod_tps
)
loop
    insert into LOCADORA_DW.DM_SOCIO values (soc.cod_soc, soc.nom_soc, soc.dsc_tps);
    commit;
end loop;

for tit in (
    select t.cod_tit, t.tpo_tit, t.cla_tit, t.dsc_tit
    from locadora.TITULOS t
)
loop
    insert into LOCADORA_DW.DM_TITULO values (tit.cod_tit, tit.tpo_tit, tit.cla_tit, tit.dsc_tit);
    commit;
end loop;

end;

select to_char(dat_venc, 'YYYYMM') from locacoes
