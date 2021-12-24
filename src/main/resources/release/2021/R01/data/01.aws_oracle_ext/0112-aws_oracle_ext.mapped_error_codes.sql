CREATE TABLE aws_oracle_ext.mapped_error_codes
(
  ora_code integer NOT NULL
, ora_exception varchar(30)
, ora_message text
, pg_code varchar(5)
, pg_exception varchar(100) 
, pg_message text
, description text
);
