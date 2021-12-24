CREATE OR REPLACE FUNCTION aws_oracle_ext.owa_util$mime_header
(
    ccontent_type IN TEXT DEFAULT 'text/html',
    bclose_header IN BOOLEAN  DEFAULT TRUE,
	ccharset      IN TEXT DEFAULT 'MaGiC_KeY'
)
RETURNS VOID AS
$BODY$
DECLARE
    charset VARCHAR(40);
BEGIN

    IF ccharset = 'MaGiC_KeY' THEN

        IF UPPER(ccontent_type) LIKE 'TEXT%' THEN

            charset := aws_oracle_ext.owa_util$get_cgi_env('REQUEST_IANA_CHARSET');
            
            IF charset IS NULL THEN
               
                PERFORM aws_oracle_ext.htp$prn
                (
                    CONCAT
                    (
                        'Content-type: ',
                        ccontent_type,
                        E'\n'
                    )
                );

            ELSE

                PERFORM aws_oracle_ext.htp$prn
                (
                    CONCAT
                    (
                        'Content-type: ',
                        ccontent_type,
                        '; charset=',
                        charset,
                        E'\n'
                    )
                );

            END IF;

         ELSE

            PERFORM aws_oracle_ext.htp$prn
            (
                CONCAT
                (
                    'Content-type: ',
                    ccontent_type,
                    E'\n'
                )
            );

        END IF;

    ELSE
         
         IF charset IS NULL THEN

            PERFORM aws_oracle_ext.htp$prn
            (
                CONCAT
                (
                    'Content-type: ',
                    ccontent_type,
                    E'\n'
                )
            );

         ELSE
            
            PERFORM aws_oracle_ext.htp$prn
            (
                CONCAT
                (
                    'Content-type: ',
                    ccontent_type,
                    '; charset=',
                    charset,
                    E'\n'
                )
            );

         END IF;

    END IF;

    IF bclose_header THEN

        PERFORM aws_oracle_ext.owa_util$http_header_close();

    END IF;

END;
$BODY$
LANGUAGE plpgsql;