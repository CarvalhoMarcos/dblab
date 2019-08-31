-------------#CRIACAO DAS TABELAS DE DIMENSAO E FATOS#------------------

CREATE TABLE dm_lugar (
    id_local   NUMBER(7,2) NOT NULL,
    nom_cdd    VARCHAR2(100 CHAR) NOT NULL,
    nom_reg    VARCHAR2(100 CHAR) NOT NULL,
    nom_est    VARCHAR2(100 CHAR)
);

ALTER TABLE dm_lugar ADD CONSTRAINT local_pk PRIMARY KEY ( id_local );

CREATE TABLE dm_tempo (
    num_mes    NUMBER(10,2) NOT NULL,
    num_smt    NUMBER(10,2) NOT NULL,
    num_ano    NUMBER(10,2) NOT NULL,
    bi_ano     NUMBER(10,2) NOT NULL,
    tri_ano    NUMBER(10,2) NOT NULL,
    id_tempo   NUMBER(8,2) NOT NULL
);

ALTER TABLE dm_tempo ADD CONSTRAINT dm_tempo_pk PRIMARY KEY ( id_tempo );

CREATE TABLE ft_dados (
    id_tempo            NUMBER(8,2) NOT NULL,
    id_local            NUMBER(7,2) NOT NULL,
    valor               NUMBER(10,2) NOT NULL,
    qnt_bene            NUMBER(10,2) NOT NULL,
    dm_tempo_id_tempo   NUMBER(8,2) NOT NULL
);

ALTER TABLE ft_dados ADD CONSTRAINT ft_dados_pk PRIMARY KEY ( id_tempo,
                                                              id_local );

ALTER TABLE ft_dados
    ADD CONSTRAINT id_local_fk FOREIGN KEY ( id_local )
        REFERENCES dm_lugar ( id_local );

ALTER TABLE ft_dados
    ADD CONSTRAINT id_tempo_fk FOREIGN KEY ( dm_tempo_id_tempo )
        REFERENCES dm_tempo ( id_tempo );
        


---------------#CRIACAO DE TABELA TEMPORARIA PARA IMPORTACAO DO CSV#------------------

CREATE TABLE bf_temp(
    COD NUMBER(7,0),
    MES NUMBER(2),
    ANO NUMBER(4),
    BIMESTRE NUMBER(2),
    TRIMESTRE NUMBER(2),
    SEMESTRE NUMBER(2),
    SIGLA VARCHAR2(2 CHAR),
    ESTADO VARCHAR(50 CHAR),
    CIDADE VARCHAR(50 CHAR),
    REGIAO VARCHAR(50 CHAR),
    VALOR NUMBER(10,2),
    QNT_BNF NUMBER(10,0)
);