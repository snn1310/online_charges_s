/*
Parse and check Oracle format models
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.to_char_parser
(
    pStr VARCHAR,
    pType VARCHAR,
    pFm VARCHAR DEFAULT NULL
)
RETURNS TABLE(ok VARCHAR, tail VARCHAR, fm VARCHAR) 
LANGUAGE plpgsql
    VOLATILE
    ROWS 1
AS
$BODY$
DECLARE
    vRes VARCHAR;
    vStr VARCHAR;
    vPos INTEGER;
    vChunk VARCHAR;
    vGrp VARCHAR;
    vWrapTo VARCHAR;
    vYYYY VARCHAR;
    
    curDateFmtModels CURSOR (pGrp VARCHAR, pYYY VARCHAR) FOR
    SELECT fm.fmt,
        fm.wrapto
    FROM aws_oracle_ext.format_models fm
    WHERE tp = 'datetime'
    AND grp = pGrp
    AND (pYYY IS NULL OR (pYYY IS NOT NULL AND fm.fmt = pYYY))
    ORDER BY ord,
        fmt;

    eDateFormatNotRecognized CONSTANT VARCHAR := 'ORA-01821: date format not recognized';

    curNumberFmtModels CURSOR (pGrp VARCHAR) FOR
    SELECT fmt
    FROM aws_oracle_ext.format_models fm
    WHERE tp = 'number'
    AND grp = pGrp
    ORDER BY grp, ord;

    eInvalidNumberFormat CONSTANT VARCHAR := 'ORA-01481: invalid number format model';

    vModel VARCHAR;

    vFM VARCHAR;
BEGIN

    vStr := pStr;
    vPos := 1;

    vFm := COALESCE(pFm,'');

    CASE
        
        WHEN pType = 'number' THEN

            vGrp := UPPER(SUBSTR(vStr,1,1));
            
            OPEN curNumberFmtModels(vGrp);
            
            LOOP
                            
                FETCH curNumberFmtModels INTO vModel;
                
                EXIT WHEN NOT FOUND;

                vChunk := SUBSTR(vStr,1,  LENGTH(REPLACE(vModel, '\', '')));

                IF UPPER(vChunk) <> REPLACE(vModel, '\', '') THEN

                    vChunk := NULL;

                END IF;
                            
                IF vChunk IS NOT NULL THEN

                    vRes := CONCAT(vRes, SUBSTR(vStr, 1, LENGTH(vChunk)));
                    vPos := vPos + LENGTH(vChunk);
                    vStr := SUBSTR(vStr, vPos);

                    EXIT;

                END IF;

            END LOOP;

            CLOSE curNumberFmtModels;

            IF vChunk IS NULL THEN
                            
                RAISE USING MESSAGE := eInvalidNumberFormat;

            END IF;

        ELSE

            LOOP
            
                    -- special treat for FM/FX
                    IF UPPER(SUBSTR(vStr,1,2)) = 'FM' THEN

                        vFM := CASE WHEN vFM <> 'FM' THEN 'FM' ELSE '' END;
                        vStr := SUBSTR(vStr,3);
                    
                    END IF;

                    --If quotted - grab it
                    IF SUBSTR(vStr,1,1) = '"' THEN

                        vChunk := SUBSTRING(vStr FROM '"[^"]*"');

                        -- if unclosed quota - raise
                        IF vChunk IS NULL THEN

                            RAISE USING MESSAGE := eDateFormatNotRecognized;

                        END IF;

                        vRes := CONCAT(vFm, vRes, vChunk);
                        vPos := vPos + LENGTH(vChunk);
                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    -- spacers grab it
                    -- we will treat , and . specialy because of A.M. likes or Y,YYYY
                    IF SUBSTR(vStr,1,1) ~ '^[\.\,]' THEN

                        vChunk := SUBSTRING(vStr FROM '[\.\,]+');
                        vRes := CONCAT(vFM, vRes, vChunk);
                        vPos := vPos + LENGTH(vChunk);
                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    IF SUBSTR(vStr,1,1) ~ '[\s\!\\\/\#\$\%\&\''\(\)\*\+\\\-\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~]' THEN
                        
                        vChunk := SUBSTRING(vStr FROM '[\s\!\\\/\#\$\%\&\''\(\)\*\+\\\-\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~]+');
                        vRes := CONCAT(vFM, vRes, vChunk);
                        vPos := vPos + LENGTH(vChunk);
                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    vGrp := UPPER(SUBSTR(vStr,1,1));
                    
                    IF vGrp = 'Y' THEN
			
                        CASE
                            WHEN UPPER(SUBSTR(vStr,1,9)) IN ('Y,YYYTHSP', 'Y,YYYSPTH') THEN
                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,9)),',','\,');
                            WHEN UPPER(SUBSTR(vStr,1,7)) IN ('Y,YYYTH', 'Y,YYYSP') THEN
                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,7)),',','\,');
                            WHEN UPPER(SUBSTR(vStr,1,5)) = 'Y,YYY' THEN
                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,5)),',','\,');
                            ELSE
                                vYYYY := NULL;
                        END CASE;

                    END IF;

                    OPEN curDateFmtModels(CASE WHEN vGrp = 'E' THEN 'Y' ELSE vGrp END, vYYYY);

                    LOOP
                        
                        FETCH curDateFmtModels INTO vModel, vWrapTo;
                        
                        EXIT WHEN NOT FOUND;
        
                        vChunk := SUBSTR(vStr,1,  LENGTH(REPLACE(vModel, '\', '')));

                        IF UPPER(vChunk) <> REPLACE(vModel, '\', '') THEN

                            vChunk := NULL;

                        END IF;
                        
                        IF vChunk IS NOT NULL THEN

                            vRes := CONCAT
                            (
                                vFM,
                                vRes,
                                CASE 
                                    WHEN vWrapTo IS NOT NULL THEN
                                        CASE 
                                            WHEN  vWrapTo = 'R->Y' THEN
                                                REPLACE(REPLACE(vChunk, 'R', 'Y'), 'r', 'y')
                                            ELSE
                                                REGEXP_REPLACE(SUBSTR(vStr, 1, LENGTH(vChunk)), CONCAT('(',SUBSTR(vStr, 1, LENGTH(vChunk)),')'), vWrapTo)
                                        END
                                    ELSE 
                                        SUBSTR(vStr, 1, LENGTH(vChunk)) 
                                END
                            );
                            vPos := vPos + LENGTH(vChunk);
                            vStr := SUBSTR(vStr, vPos);

                            EXIT;

                        END IF;

                    END LOOP;

                    CLOSE curDateFmtModels;

                    IF vChunk IS NULL THEN
                        
                        RAISE USING MESSAGE := eDateFormatNotRecognized;

                    END IF;

                    EXIT;

                END LOOP;

        END CASE;

    RETURN QUERY VALUES (vRes, CASE WHEN LENGTH(vStr) = 0 THEN NULL::VARCHAR ELSE vStr END, vFM);
        
END;
$BODY$;

