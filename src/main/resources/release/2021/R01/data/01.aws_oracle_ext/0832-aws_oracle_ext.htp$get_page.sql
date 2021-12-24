CREATE OR REPLACE FUNCTION aws_oracle_ext.htp$get_page
(
    IN pPagePart TEXT
)
RETURNS TABLE(page_text TEXT) 
AS
$BODY$
DECLARE
    vPagePart TEXT;
    vHeaderPosition BIGINT;
    rec RECORD;
    headerExists BOOLEAN DEFAULT FALSE;
BEGIN

    IF COALESCE(pPagePart, NULL) NOT IN ('headers', 'body') THEN

        vPagePart := 'body';

    ELSE

        vPagePart := pPagePart;

    END IF;

    FOR rec IN
    (
        SELECT id,
            column_value
        FROM aws_htbuf_arr
        ORDER BY id
    ) LOOP

        IF rec.column_value = E'\n\n' THEN

            vHeaderPosition := rec.id;
            headerExists := TRUE;
            EXIT;

        END IF;

        IF rec.column_value ~ '^\n$' THEN

            IF vHeaderPosition IS NOT NULL THEN

                vHeaderPosition := rec.id;
                headerExists := TRUE;
                EXIT;

            ELSE

                vHeaderPosition := rec.id;

            END IF;

        END IF;

        IF rec.column_value ~ '\n$' AND rec.column_value !~ '^\n$' THEN

            vHeaderPosition := rec.id;

        END IF;

        IF rec.column_value !~ '\n$' AND vHeaderPosition IS NOT NULL THEN

            vHeaderPosition := NULL;

        END IF;


    END LOOP;

    IF NOT headerExists THEN

        vHeaderPosition := NULL;

    END IF;

    IF vPagePart = 'headers' THEN

        RETURN QUERY
        SELECT aha.column_value
        FROM aws_htbuf_arr aha
        WHERE aha.id < vHeaderPosition
        ORDER BY id;

    ELSE

        RETURN QUERY
        SELECT aha.column_value
        FROM aws_htbuf_arr aha
        WHERE aha.id > COALESCE(vHeaderPosition, 0)
        ORDER BY id;

    END IF;

    RETURN;

END;    
$BODY$
LANGUAGE plpgsql;