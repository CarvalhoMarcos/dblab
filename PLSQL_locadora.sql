declare
    v_multa locadora_dw.ft_locacoes.multa_atraso%TYPE;
    v_arrec locadora_dw.ft_locacoes.valor_arrecadado%TYPE;
    v_tmpdev LOCADORA_DW.ft_locacoes.tempo_devolucao%TYPE;
begin
-- ARTISTA --
for art in(
    select a.cod_art, a.tpo_art, a.nac_bras, a.nom_art
    from locadora.artistas a
)
loop
    insert into LOCADORA_DW.DM_ARTISTA values(art.cod_art, 
                                              art.tpo_art, 
                                              art.nac_bras, 
                                              art.nom_art);
    commit;
end loop;
-- GRAVADORAS --
for gra in(
    select g.cod_grav, g.uf_grav, g.nac_bras, g.nom_grav
    from locadora.gravadoras g
)
loop
    insert into LOCADORA_DW.DM_GRAVADORA values(gra.cod_grav, 
                                                gra.uf_grav, 
                                                gra.nac_bras, 
                                                gra.nom_grav);
    commit;
end loop;
-- SOCIO --
for soc in ( 
    select s.cod_soc, s.nom_soc, ts.dsc_tps
    from LOCADORA.socios s , locadora.tipos_socios ts
    where s.cod_tps = ts.cod_tps
)
loop
    insert into LOCADORA_DW.DM_SOCIO values (soc.cod_soc, 
                                             soc.nom_soc, 
                                             soc.dsc_tps);
    commit;
end loop;
-- TITULOS --
for tit in (
    select t.cod_tit, t.tpo_tit, t.cla_tit, t.dsc_tit
    from locadora.TITULOS t
)
loop
    insert into LOCADORA_DW.DM_TITULO values (tit.cod_tit, 
                                              tit.tpo_tit, 
                                              tit.cla_tit, 
                                              tit.dsc_tit);
    commit;
end loop;
-- TEMPO --
for dat in (
    select distinct to_number(to_char(dt.dat_loc, 'MM')) MES, 
                    to_number(to_char(dt.dat_loc, 'YYYY')) ANO,
                    to_number(to_char(dt.dat_loc, 'DDMMYY')) TUDO, 
                    to_number(to_char(dt.dat_loc, 'YYYYMM')) ANOMES,
                    to_char(dt.dat_loc, 'MON') SGMES,
                    to_char(dt.dat_loc, 'MON')||to_char(dt.dat_loc, 'YYYY') NMMA,
                    to_char(dt.dat_loc, 'MONTH') NMES,
                    to_number(to_char(dt.dat_loc, 'DD')) NDIA,
                    dt.dat_loc DTDATA
    from locadora.locacoes dt
)
loop
    insert into LOCADORA_DW.DM_TEMPO values(DAT.TUDO, 
                                            DAT.ANO,
                                            DAT.MES,
                                            DAT.ANOMES,
                                            DAT.SGMES,
                                            DAT.NMMA,
                                            DAT.NMES,
                                            DAT.NDIA,
                                            DAT.DTDATA);
    COMMIT;
end loop;
--LOCACOES--
for loc in (
            select ar.cod_art artista, tit.cod_tit titulo, grav.cod_grav gravadora, il.cod_soc socio, to_number(to_char(il.dat_loc, 'DDMMYY')) dtlocacao, il.dat_dev - il.dat_loc tmpdevolucao ,il.dat_dev - loc.dat_venc atraso, il.val_loc valor, il.sta_mul estadoMulta
            from artistas ar, titulos tit, gravadoras grav, itens_locacoes il, locacoes loc
            where ar.cod_art = tit.cod_art and 
                  grav.cod_grav = tit.cod_grav (+) and 
                  il.cod_tit = tit.cod_tit and 
                  il.cod_soc = loc.cod_soc and 
                  il.dat_loc = loc.dat_loc
)
loop
-- CALCULO DA MULTA--
    IF (loc.atraso > 0 AND loc.estadomulta = 'P') THEN
        v_multa := loc.valor + (0.3 * (loc.atraso - 1));
        v_arrec := loc.valor;
        v_tmpdev := loc.tmpdevolucao;
    ELSIF (loc.atraso > 0 AND loc.estadomulta = 'Q') THEN
        v_multa := loc.valor + (0.3 * (loc.atraso - 1));
        v_arrec := loc.valor + v_multa;
        v_tmpdev := loc.tmpdevolucao;
    ELSIF (loc.atraso <= 0 or loc.estadomulta = 'N' or loc.tmpdevolucao = null) THEN
        v_multa := 0;
        v_arrec := loc.valor;
        v_tmpdev := 0;
    END IF;
INSERT INTO LOCADORA_DW.ft_locacoes VALUES (loc.socio, loc.titulo, loc.artista, loc.gravadora, loc.dtlocacao, v_arrec, v_tmpdev, v_multa);
commit;
end loop;
   
end;

