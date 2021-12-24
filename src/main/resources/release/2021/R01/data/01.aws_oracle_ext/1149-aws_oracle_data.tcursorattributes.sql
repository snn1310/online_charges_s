DO
$BODY$
BEGIN
create type aws_oracle_data.TCursorAttributes as
              (isopen boolean,
               rowcount bigint,
               found    boolean,
               notfound boolean
              );
EXCEPTION WHEN SQLSTATE '42710' THEN NULL; 
   
END;  
$BODY$