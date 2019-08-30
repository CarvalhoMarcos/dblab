select * from LOCADORA.artistas;
select cod_art from locadora.artistas where cod_art = 9;

declare
    v_id locadora.artistas.cod_art%type;
    v_tpo locadora.artistas.tpo_art%type;
    v_nac locadora.artistas.nac_bras%type;
    v_nome locadora.artistas.nom_art%type;
begin
    select a.cod_art into v_id from locadora.artistas a where a.cod_art =1;
    select a.tpo_art into v_tpo from locadora.artistas a where a.cod_art =1;
    select a.nac_bras into v_nac from locadora.artistas a where a.cod_art =1;
    select a.nom_art into v_nome from locadora.artistas a where a.cod_art =1;
    
    insert into locadora_dw.dm_artista values(v_id, v_tpo, v_nac, v_nome);
    commit;
end;

select * from locadora_dw.dm_artista;