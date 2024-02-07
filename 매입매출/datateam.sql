DROP DATABASE animal;
CREATE DATABASE animal;
USE animal;
SHOW TABLES;
CREATE TABLE tbl_animal (
a_name	VARCHAR(20)		PRIMARY KEY,
a_condition	VARCHAR(300)	NOT NULL,	
a_food	VARCHAR(300)	NOT NULL	,
a_habit	VARCHAR(300)	NOT NULL	,
a_caution	VARCHAR(300)	NOT NULL
);
CREATE TABLE tbl_members(
m_username	VARCHAR(15)		PRIMARY KEY,
m_password	VARCHAR(125)	NOT NULL	,
m_realname	VARCHAR(20)		,
m_tel	VARCHAR(15)		,
m_role	VARCHAR(5)		

);
CREATE TABLE tbl_check(
u_user	VARCHAR(15)	NOT NULL		,
u_check	VARCHAR(100)	NOT NULL		

);
CREATE TABLE tbl_notice (
n_director	VARCHAR(20)		PRIMARY KEY,
n_viewer	VARCHAR(20)		,
n_caution	VARCHAR(200)		

);

CREATE TABLE tbl_bbd(
num	BIGINT		PRIMARY KEY,
author	VARCHAR(150)	NOT NULL	,
password	VARCHAR(150)	NOT NULL	,
title	VARCHAR(150)	NOT NULL	,
content	TEXT	NOT NULL	

);