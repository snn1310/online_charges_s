CREATE OR REPLACE FUNCTION aws_oracle_ext.get_cmd_type_by_sql_func_code(IN p_sql_func_code INTEGER)
RETURNS TEXT
AS
$function$
DECLARE
    v_cmd_type TEXT;
    v_cmd_types TEXT[] = ARRAY['DDL', -- Data Definition Language (DDL)
                               'DML', -- Data Manipulation Language (DML)
                               'DCL', -- Data Control Language (DCL)
                               'TCL', -- Transaction Control Language (TCL)
                               'SCL', -- Session Control Language (SCL)
                               'SCS']; -- System Control Statement (SCS)
BEGIN
    /* See list of possible function codes here:
       https://docstore.mik.ua/orelly/oracle/bipack/ch02_03.htm
    */
    v_cmd_type := CASE p_sql_func_code
                     WHEN 1 -- CREATE [TEMP ]TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 2 -- SET ROLE
                     THEN v_cmd_types[5] -- SCL
                     WHEN 3 -- INSERT[ INTO]
                     THEN v_cmd_types[2] -- DML
                     WHEN 4 -- SELECT
                     THEN v_cmd_types[2] -- DML
                     WHEN 5 -- UPDATE
                     THEN v_cmd_types[2] -- DML
                     WHEN 6 -- DROP ROLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 7 -- DROP VIEW
                     THEN v_cmd_types[1] -- DDL
                     WHEN 8 -- DROP TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 9 -- DELETE[ FROM]
                     THEN v_cmd_types[2] -- DML
                     WHEN 10 -- CREATE [TEMP ]VIEW
                     THEN v_cmd_types[1] -- DDL
                     WHEN 11 -- DROP USER|SCHEMA
                     THEN v_cmd_types[1] -- DDL
                     WHEN 12 -- CREATE ROLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 13 -- CREATE [TEMP ]SEQUENCE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 14 -- ALTER SEQUENCE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 16 -- DROP SEQUENCE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 18 -- CREATE CLUSTER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 19 -- CREATE USER|SCHEMA
                     THEN v_cmd_types[1] -- DDL
                     WHEN 20 -- CREATE INDEX
                     THEN v_cmd_types[1] -- DDL
                     WHEN 21 -- DROP INDEX
                     THEN v_cmd_types[1] -- DDL
                     WHEN 22 -- DROP CLUSTER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 24 -- CREATE[ OR REPLACE] PROCEDURE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 25 -- ALTER PROCEDURE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 26 -- ALTER TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 27 -- EXPLAIN[ PLAN]
                     THEN v_cmd_types[2] -- DML
                     WHEN 28 -- GRANT
                     THEN v_cmd_types[3] -- DCL
                     WHEN 29 -- REVOKE
                     THEN v_cmd_types[3] -- DCL
                     WHEN 30 -- CREATE[ OR REPLACE] SYNONYM
                     THEN v_cmd_types[1] -- DDL
                     WHEN 31 -- DROP SYNONYM
                     THEN v_cmd_types[1] -- DDL
                     WHEN 32 -- ALTER SYSTEM
                     THEN v_cmd_types[6] -- SCS
                     WHEN 33 -- SET TRANSACTION
                     THEN v_cmd_types[4] -- TCL
                     WHEN 34 -- PL/SQL EXECUTE
                     THEN v_cmd_types[2] -- DML
                     WHEN 35 -- LOCK[ TABLE]
                     THEN v_cmd_types[2] -- DML
                     WHEN 37 -- RENAME
                     THEN v_cmd_types[1] -- DDL
                     WHEN 38 -- COMMENT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 39 -- AUDIT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 40 -- NOAUDIT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 41 -- ALTER INDEX
                     THEN v_cmd_types[1] -- DDL
                     WHEN 44 -- CREATE DATABASE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 45 -- ALTER DATABASE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 46 -- CREATE[ OR REPLACE] ROLLBACK SEGMENT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 47 -- ALTER ROLLBACK SEGMENT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 48 -- DROP ROLLBACK SEGMENT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 49 -- CREATE[ TEMPORARY] TABLESPACE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 50 -- ALTER TABLESPACE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 51 -- DROP TABLESPACE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 52 -- ALTER SESSION
                     THEN v_cmd_types[5] -- SCL
                     WHEN 53 -- ALTER USER|SCHEMA
                     THEN v_cmd_types[1] -- DDL
                     WHEN 54 -- COMMIT[ WORK]
                     THEN v_cmd_types[4] -- TCL
                     WHEN 55 -- ROLLBACK[ WORK]
                     THEN v_cmd_types[4] -- TCL
                     WHEN 56 -- SAVEPOINT
                     THEN v_cmd_types[4] -- TCL
                     WHEN 57 -- CREATE CONTROL FILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 59 -- CREATE TRIGGER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 60 -- ALTER TRIGGER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 61 -- DROP TRIGGER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 62 -- ANALYZE TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 63 -- ANALYZE INDEX
                     THEN v_cmd_types[1] -- DDL
                     WHEN 64 -- ANALYZE CLUSTER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 65 -- CREATE PROFILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 66 -- DROP PROFILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 67 -- ALTER PROFILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 68 -- DROP PROCEDURE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 70 -- ALTER RESOURCE COST
                     THEN v_cmd_types[1] -- DDL
                     WHEN 71 -- CREATE SNAPSHOT LOG
                     THEN v_cmd_types[1] -- DDL
                     WHEN 72 -- ALTER SNAPSHOT LOG
                     THEN v_cmd_types[1] -- DDL
                     WHEN 73 -- DROP SNAPSHOT LOG
                     THEN v_cmd_types[1] -- DDL
                     WHEN 74 -- CREATE SNAPSHOT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 75 -- ALTER SNAPSHOT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 76 -- DROP SNAPSHOT
                     THEN v_cmd_types[1] -- DDL
                     WHEN 77 -- CREATE[ OR REPLACE] TYPE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 78 -- DROP TYPE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 79 -- ALTER ROLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 80 -- ALTER TYPE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 81 -- CREATE[ OR REPLACE] TYPE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 82 -- ALTER TYPE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 83 -- DROP TYPE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 84 -- DROP LIBRARY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 85 -- TRUNCATE TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 86 -- TRUNCATE CLUSTER
                     THEN v_cmd_types[1] -- DDL
                     WHEN 87 -- CREATE BITMAPFILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 88 -- ALTER VIEW
                     THEN v_cmd_types[1] -- DDL
                     WHEN 89 -- DROP BITMAPFILE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 90 -- SET CONSTRAINT[S]
                     THEN v_cmd_types[4] -- TCL
                     WHEN 91 -- CREATE[ OR REPLACE] FUNCTION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 92 -- ALTER FUNCTION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 93 -- DROP FUNCTION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 94 -- CREATE[ OR REPLACE] PACKAGE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 95 -- ALTER PACKAGE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 96 -- DROP PACKAGE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 97 -- CREATE[ OR REPLACE] PACKAGE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 98 -- ALTER PACKAGE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 99 -- DROP PACKAGE BODY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 157 -- CREATE[ OR REPLACE] DIRECTORY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 158 -- DROP DIRECTORY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 159 -- CREATE[ OR REPLACE] LIBRARY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 170 -- CALL METHOD
                     THEN v_cmd_types[2] -- DML
                     WHEN 189 -- MERGE
                     THEN v_cmd_types[2] -- DML
                     WHEN 197 -- PURGE RECYCLEBIN
                     THEN v_cmd_types[1] -- DDL
                     WHEN 198 -- PURGE DBA_RECYCLEBIN
                     THEN v_cmd_types[1] -- DDL
                     WHEN 199 -- PURGE TABLESPACE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 200 -- PURGE TABLE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 201 -- PURGE INDEX
                     THEN v_cmd_types[1] -- DDL
                     WHEN 202 -- FLASHBACK (UNDROP)
                     THEN v_cmd_types[1] -- DDL
                     WHEN 203 -- DROP DATABASE
                     THEN v_cmd_types[1] -- DDL
                     WHEN 243 -- CREATE[ OR REPLACE] ATTRIBUTE DIMENSION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 244 -- ALTER ATTRIBUTE DIMENSION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 245 -- DROP ATTRIBUTE DIMENSION
                     THEN v_cmd_types[1] -- DDL
                     WHEN 246 -- CREATE[ OR REPLACE] HIERARCHY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 247 -- ALTER HIERARCHY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 248 -- DROP HIERARCHY
                     THEN v_cmd_types[1] -- DDL
                     WHEN 249 -- CREATE[ OR REPLACE] ANALYTIC VIEW
                     THEN v_cmd_types[1] -- DDL
                     WHEN 250 -- ALTER ANALYTIC VIEW
                     THEN v_cmd_types[1] -- DDL
                     WHEN 251 -- DROP ANALYTIC VIEW
                     THEN v_cmd_types[1] -- DDL
                  END;

    RETURN v_cmd_type;
END;
$function$
LANGUAGE plpgsql
IMMUTABLE
RETURNS NULL ON NULL INPUT;