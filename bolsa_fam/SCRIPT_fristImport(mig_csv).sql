--------------------------------------------------------
--  Arquivo criado - Sábado-Agosto-31-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BF_TEMP
--------------------------------------------------------

  CREATE TABLE "BOLSA"."BF_TEMP" 
   (	"COD" NUMBER(7,0), 
	"MES" NUMBER(2,0), 
	"ANO" NUMBER(4,0), 
	"BIMESTRE" NUMBER(2,0), 
	"TRIMESTRE" NUMBER(2,0), 
	"SEMESTRE" NUMBER(2,0), 
	"SIGLA" VARCHAR2(2 CHAR), 
	"ESTADO" VARCHAR2(50 CHAR), 
	"CIDADE" VARCHAR2(50 CHAR), 
	"REGIAO" VARCHAR2(50 CHAR), 
	"VALOR" NUMBER(10,2), 
	"QNT_BNF" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BOLSA" ;
REM INSERTING into BOLSA.BF_TEMP
SET DEFINE OFF;
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','1','2017','1','1','1','SE','SERGIPE','ARACAJU','Nordeste','44996850','33130');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','2','2017','1','1','1','SE','SERGIPE','ARACAJU','Nordeste','45444280','33244');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','3','2017','2','1','1','SE','SERGIPE','ARACAJU','Nordeste','44465310','32974');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','4','2017','2','2','1','SE','SERGIPE','ARACAJU','Nordeste','44181750','32676');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','5','2017','3','2','1','SE','SERGIPE','ARACAJU','Nordeste','43586330','32120');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','6','2017','3','2','1','SE','SERGIPE','ARACAJU','Nordeste','43030640','31867');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','7','2017','4','3','2','SE','SERGIPE','ARACAJU','Nordeste','41859470','31010');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','8','2017','4','3','2','SE','SERGIPE','ARACAJU','Nordeste','41776890','30923');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','9','2017','5','3','2','SE','SERGIPE','ARACAJU','Nordeste','41472140','30611');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','10','2017','5','4','2','SE','SERGIPE','ARACAJU','Nordeste','41708900','30833');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','11','2017','6','4','2','SE','SERGIPE','ARACAJU','Nordeste','41894440','30734');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','12','2017','6','4','2','SE','SERGIPE','ARACAJU','Nordeste','42023640','30943');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','1','2018','1','1','1','SE','SERGIPE','ARACAJU','Nordeste','42177070','31227');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','2','2018','1','1','1','SE','SERGIPE','ARACAJU','Nordeste','42069350','31440');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','3','2018','2','1','1','SE','SERGIPE','ARACAJU','Nordeste','42401620','31747');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','4','2018','2','2','1','SE','SERGIPE','ARACAJU','Nordeste','41191520','30765');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','5','2018','3','2','1','SE','SERGIPE','ARACAJU','Nordeste','42125560','31330');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','6','2018','3','2','1','SE','SERGIPE','ARACAJU','Nordeste','42120400','31319');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','7','2018','4','3','2','SE','SERGIPE','ARACAJU','Nordeste','44904490','31606');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','8','2018','4','3','2','SE','SERGIPE','ARACAJU','Nordeste','45690320','31992');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','9','2018','5','3','2','SE','SERGIPE','ARACAJU','Nordeste','45072720','31562');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','10','2018','5','4','2','SE','SERGIPE','ARACAJU','Nordeste','45630750','31901');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','11','2018','6','4','2','SE','SERGIPE','ARACAJU','Nordeste','46388230','32139');
Insert into BOLSA.BF_TEMP (COD,MES,ANO,BIMESTRE,TRIMESTRE,SEMESTRE,SIGLA,ESTADO,CIDADE,REGIAO,VALOR,QNT_BNF) values ('2800308','12','2018','6','4','2','SE','SERGIPE','ARACAJU','Nordeste','45569580','31380');