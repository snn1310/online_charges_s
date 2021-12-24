CREATE OR REPLACE FUNCTION aws_oracle_ext.bulk$fetch_cursor
(
    IN pCur REFCURSOR,
    INOUT pRecordType ANYELEMENT,
    IN pLimit DOUBLE PRECISION DEFAULT -1
)
RETURNS SETOF ANYELEMENT
AS
$BODY$
BEGIN
    LOOP
      FETCH $1 INTO $2; 
      IF (NOT FOUND) THEN
          EXIT;
      END IF;

      pLimit := pLimit-1;  
      RETURN NEXT;

      IF (pLimit=0) THEN
          EXIT;
      END IF;
    END LOOP;
  RETURN;
END;
$BODY$
LANGUAGE plpgsql;