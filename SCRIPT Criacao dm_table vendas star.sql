CREATE TABLE dm_produtos (
    id_prod       NUMBER(6) NOT NULL,
    dsc_prod      VARCHAR2(300) NOT NULL,
    nom_forn      VARCHAR2(300) NOT NULL,
    regiao_forn   VARCHAR2(20) NOT NULL,
    classe_prod   VARCHAR2(50) NOT NULL
);

ALTER TABLE dm_produtos ADD CONSTRAINT dm_produtos_pk PRIMARY KEY ( id_prod );

CREATE TABLE dm_tempo (
    id_tempo    NUMBER(5) NOT NULL,
    nu_ano      NUMBER(4) NOT NULL,
    nu_mes      NUMBER(2) NOT NULL,
    nu_anomes   NUMBER(7) NOT NULL,
    sg_mes      CHAR(3) NOT NULL,
    nm_mesano   CHAR(8) NOT NULL,
    nm_mes      VARCHAR2(15) NOT NULL,
    nu_dia      NUMBER(2) NOT NULL
);

ALTER TABLE dm_tempo ADD CONSTRAINT dm_tempo_pk PRIMARY KEY ( id_tempo );

CREATE TABLE dm_tipos_vendas (
    id_tipo_venda     NUMBER(3) NOT NULL,
    desc_tipo_venda   VARCHAR2(300) NOT NULL
);

ALTER TABLE dm_tipos_vendas ADD CONSTRAINT dm_tipos_vendas_pk PRIMARY KEY ( id_tipo_venda );

CREATE TABLE ft_vendas (
    id_prod         NUMBER(6) NOT NULL,
    id_tempo        NUMBER(5) NOT NULL,
    id_tipo_venda   NUMBER(3) NOT NULL,
    valor_venda     NUMBER(10,2) NOT NULL
);

ALTER TABLE ft_vendas
    ADD CONSTRAINT ft_vendas_dm_produtos_fk FOREIGN KEY ( id_prod )
        REFERENCES dm_produtos ( id_prod );

ALTER TABLE ft_vendas
    ADD CONSTRAINT ft_vendas_dm_tempo_fk FOREIGN KEY ( id_tempo )
        REFERENCES dm_tempo ( id_tempo );

ALTER TABLE ft_vendas
    ADD CONSTRAINT ft_vendas_dm_tipos_vendas_fk FOREIGN KEY ( id_tipo_venda )
        REFERENCES dm_tipos_vendas ( id_tipo_venda );
