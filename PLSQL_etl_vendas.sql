DECLARE
 v_regiao vendas_dw.DM_PRODUTOS.regiao_forn%TYPE;
 v_classp vendas_dw.DM_PRODUTOS.classe_prod%TYPE;
 v_tpvend VENDAS_DW.ft_vendas.id_tipo_venda%TYPE;
 
BEGIN
--PRODUTO--
FOR pro IN(
    SELECT pr.cod_prod cpro, pr.dsc_prod dpro, f.nom_forn nfor, f.uf_forn ufor, pr.preco_pro ppro
    FROM produtos pr, fornecedores f
    WHERE pr.cod_forn = f.cod_forn    
)
LOOP
        IF (pro.ppro <= 200) THEN
        v_classp := 'POPULAR';
        ELSIF (pro.ppro > 200 AND pro.ppro <= 200) THEN
        v_classp := 'LINHA MEDIA';
        ELSE
        v_classp := 'ALTA LINHA';
        END IF;
        
        IF (pro.ufor = 'MA' OR 
            pro.ufor = 'PI' OR 
            pro.ufor = 'CE' OR 
            pro.ufor = 'RN' OR 
            pro.ufor = 'PB' OR 
            pro.ufor = 'PE' OR 
            pro.ufor = 'AL' OR 
            pro.ufor = 'SE' OR 
            pro.ufor = 'BA') THEN
        v_regiao := 'NORDESTE';
        ELSIF (pro.ufor = 'AC' OR 
               pro.ufor = 'AM' OR
               pro.ufor = 'RR' OR 
               pro.ufor = 'RO' OR 
               pro.ufor = 'PA' OR 
               pro.ufor = 'AP' OR 
               pro.ufor = 'TO') THEN
        v_regiao := 'NORTE';
        ELSIF ( pro.ufor = 'MG' OR pro.ufor = 'ES' OR pro.ufor = 'RJ' OR pro.ufor = 'SP') THEN
        v_regiao := 'SUDESTE';
        ELSIF ( pro.ufor = 'MT' OR pro.ufor = 'DF' OR pro.ufor = 'GO' OR pro.ufor = 'MS') THEN
        v_regiao := 'CENTRO-OESTE';
        ELSIF ( pro.ufor = 'PR' OR pro.ufor = 'SC' OR pro.ufor = 'RS') THEN
        v_regiao := 'SUL';
        END IF;
        
    INSERT INTO VENDAS_DW.dm_produtos values (pro.cpro, pro.dpro, pro.nfor, v_regiao, v_classp);
    COMMIT;
    
    
END LOOP;

--TIPO DE VENDA--
INSERT INTO VENDAS_DW.dm_tipos_vendas values(001 , 'A PRAZO');
INSERT INTO VENDAS_DW.dm_tipos_vendas values(002 , 'A VISTA');
COMMIT;

--TEMPO--
for dat in (
    select distinct to_number(to_char(dt.dat_nota, 'MM')) MES, 
                    to_number(to_char(dt.dat_nota, 'YYYY')) ANO,
                    to_number(to_char(dt.dat_nota, 'DDMMY')) TUDO, 
                    to_number(to_char(dt.dat_nota, 'YYYYMM')) ANOMES,
                    to_char(dt.dat_nota, 'MON') SGMES,
                    to_char(dt.dat_nota, 'MON')||to_char(dt.dat_nota, 'YYYY') NMMA,
                    to_char(dt.dat_nota, 'MONTH') NMES,
                    to_number(to_char(dt.dat_nota, 'DD')) NDIA,
                    dt.dat_nota DTDATA
    from vendas.notas_fiscais dt
)
loop
    insert into VENDAS_DW.dm_tempo values(DAT.TUDO, 
                                            DAT.ANO,
                                            DAT.MES,
                                            DAT.ANOMES,
                                            DAT.SGMES,
                                            DAT.NMMA,
                                            DAT.NMES,
                                            DAT.NDIA);
    COMMIT;
end loop;

--VENDAS--
for vnd in(
-- Esse select so falta o campo do tipo de venda 
    SELECT inota.cod_prod cpro, inota.preco_pro * inota.qtd_ped vped, to_char(nf.dat_nota, 'DDMMY') dt
    FROM itens_de_nota inota, notas_fiscais nf
    WHERE inota.num_nota = nf.num_nota 
)
loop
--colocar o insert no loop

end loop;

/* selects que não puxam o que quero
select count distinct pe.num_ped, p.num_ped
from parcelas p, pedidos pe
where pe.num_ped = p.num_ped(+)

select count(distinct num_ped) from parcelas;

select p.num_ped nped, count(distinct p.dat_venc) nparc
from parcelas p
group by num_ped
*/

END;