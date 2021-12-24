CREATE OR REPLACE FUNCTION aws_oracle_ext.getPathparts
(
    IN ppath TEXT
)
RETURNS TEXT[]
LANGUAGE plpgsql
AS
$BODY$
BEGIN
    
    IF ppath !~ '[^\[\]]+\[.+\]' THEN

        RETURN NULL;

    END IF;

    RETURN REGEXP_SPLIT_TO_ARRAY
    (
        REPLACE
        (
            REPLACE
            (
                ppath,
                '[',
                '.'
            ),
            ']',
            ''
        ),
        '\.'
    );
END;
$BODY$;
