CREATE OR REPLACE FUNCTION aws_oracle_ext.multiset_operator
(
    pOperator IN TEXT,
    pFirstTable IN TEXT,
    pSecondTable IN TEXT,
    pCollectionType IN anyelement,
    pMode IN TEXT DEFAULT 'ALL',
    pStoreTo IN TEXT DEFAULT NULL,
    pIsGlobal IN BOOLEAN DEFAULT FALSE
)
RETURNS TEXT
LANGUAGE plpgsql
AS
$multiset_operator$
DECLARE
    vSQL VARCHAR;
	vResultTable TEXT;
	vType VARCHAR;
    vFirstStorageTable VARCHAR;
    vSecondStorageTable VARCHAR;
    vResultStorageTable VARCHAR;

BEGIN

	vType := PG_TYPEOF(pCollectionType)::text;
	
    IF pIsGlobal THEN

        PERFORM aws_oracle_ext.array$copy
        (
            p_source_param_name => pFirstTable::JSONB ->> 'Array Name',
            p_source_procedure_name => pFirstTable::JSONB ->> 'Procedure Name',
            p_dest_param_name => 'ml1$'||(pFirstTable::JSONB ->> 'Array Name'),
            p_dest_procedure_name => pFirstTable::JSONB ->> 'Procedure Name'
        );

        PERFORM aws_oracle_ext.array$copy
        (
            p_source_param_name => pSecondTable::JSONB ->> 'Array Name',
            p_source_procedure_name => pSecondTable::JSONB ->> 'Procedure Name',
            p_dest_param_name => 'ml2$'||(pSecondTable::JSONB ->> 'Array Name'),
            p_dest_procedure_name => pSecondTable::JSONB ->> 'Procedure Name'
        );

        PERFORM aws_oracle_ext.array$create_storage_table
        (
            p_array_name => 'ml1$'||(pFirstTable::JSONB ->> 'Array Name'),
            p_procedure_name => pFirstTable::JSONB ->> 'Procedure Name',
            p_cast_type_name => vType
        );

        PERFORM aws_oracle_ext.array$create_storage_table
        (
            p_array_name => 'ml2$'||(pSecondTable::JSONB ->> 'Array Name'),
            p_procedure_name => pSecondTable::JSONB ->> 'Procedure Name',
            p_cast_type_name => vType
        );

        vFirstStorageTable := aws_oracle_ext.array$get_storage_table_name
        (
            --pFirstTable::JSONB ->> 'Array Name',
            p_array_path_without_indexes => 'ml1$'||(pFirstTable::JSONB ->> 'Array Name'),
            p_procedure_name => pFirstTable::JSONB ->> 'Procedure Name'
        );

        vSecondStorageTable := aws_oracle_ext.array$get_storage_table_name
        (
            --pSecondTable::JSONB ->> 'Array Name',
            p_array_path_without_indexes => 'ml2$'||(pSecondTable::JSONB ->> 'Array Name'),
            p_procedure_name => pSecondTable::JSONB ->> 'Procedure Name'
        );

        vResultStorageTable := aws_oracle_ext.array$get_storage_table_name
        (
            pStoreTo::JSONB ->> 'Array Name',
            pStoreTo::JSONB ->> 'Procedure Name'
        );

        IF vFirstStorageTable IS NULL OR
            vSecondStorageTable IS NULL OR
            vResultStorageTable IS NULL THEN

            RAISE USING MESSAGE := 'STG';

        END IF;

        vSql := CONCAT
        (
            'TRUNCATE TABLE ',
            vResultStorageTable
        );

        EXECUTE vSql;

        vSql := CONCAT
        (
            'ALTER SEQUENCE aws_oracle_ext$sq_',
            vResultStorageTable,
            ' RESTART WITH 1'
        );

        EXECUTE vSql;


        vSQL := CONCAT
        (
            'INSERT INTO ',
            vResultStorageTable,
            '(record_body)',
            CHR(10),
            'SELECT ROW_TO_JSON(mltst) FROM ('
            'SELECT f.* FROM ',
            vFirstStorageTable,
            ' CROSS JOIN LATERAL JSONB_POPULATE_RECORD(NULL::',
            vType,
            ', record_body) f',
            CHR(10),
            pOperator,
            ' ',
            pMode,
            CHR(10),
            'SELECT s.* FROM ',
            vSecondStorageTable,
            ' CROSS JOIN LATERAL JSONB_POPULATE_RECORD(NULL::',
            vType,
            ', record_body) s',
            CHR(10),
            ') mltst'
        );

        EXECUTE vSQL;

        PERFORM aws_oracle_ext.array$drop
        (
            p_array_name => 'ml1$'||(pFirstTable::JSONB ->> 'Array Name'),
            p_procedure_name => pFirstTable::JSONB ->> 'Procedure Name'
        );

        PERFORM aws_oracle_ext.array$drop
        (
            p_array_name => 'ml2$'||(pSecondTable::JSONB ->> 'Array Name'),
            p_procedure_name => pSecondTable::JSONB ->> 'Procedure Name'
        );

    ELSE
	
        vSQL := CONCAT(
            'SELECT ARRAY(',
            CHR(10),
            'SELECT UNNEST(CAST($1 '|| 'AS '||vType||'))',
            CHR(10),
            pOperator,
            ' ',
            pMode,
            CHR(10),
            'SELECT UNNEST(CAST ($2 AS '||vType||'))',
            CHR(10),
            ')::TExt'
        );

        EXECUTE vSQL USING pFirstTable, pSecondTable INTO vResultTable;

    END IF;

    RETURN vResultTable;
END;
$multiset_operator$;
