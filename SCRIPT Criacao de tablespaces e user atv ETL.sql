CREATE TABLESPACE vendas
LOGGING DATAFILE 'vendas.dbf'
SIZE 100m AUTOEXTEND ON NEXT 100m EXTENT MANAGEMENT LOCAL;

CREATE TABLESPACE locadora
LOGGING DATAFILE 'locadora.dbf'
SIZE 100m AUTOEXTEND ON NEXT 100m EXTENT MANAGEMENT LOCAL;

CREATE USER locadora   
IDENTIFIED BY locadora
DEFAULT TABLESPACE locadora
QUOTA UNLIMITED ON locadora;

GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create sequence,
create any directory,
create type,
create synonym,
create trigger
TO
locadora;
grant dba to locadora;

CREATE USER locadora_dw   
IDENTIFIED BY locadora
DEFAULT TABLESPACE locadora
QUOTA UNLIMITED ON locadora;

GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create sequence,
create any directory,
create type,
create synonym,
create trigger
TO
locadora_dw;
grant dba to locadora_dw;

CREATE USER vendas   
IDENTIFIED BY vendas
DEFAULT TABLESPACE vendas
QUOTA UNLIMITED ON vendas;

GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create sequence,
create any directory,
create type,
create synonym,
create trigger
TO
vendas;
grant dba to vendas;

CREATE USER vendas_dw   
IDENTIFIED BY vendas
DEFAULT TABLESPACE vendas
QUOTA UNLIMITED ON vendas;

GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create sequence,
create any directory,
create type,
create synonym,
create trigger
TO
vendas_dw;
grant dba to vendas_dw;