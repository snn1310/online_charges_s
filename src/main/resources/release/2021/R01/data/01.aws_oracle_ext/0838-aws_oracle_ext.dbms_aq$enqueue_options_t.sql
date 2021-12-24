create type aws_oracle_ext.dbms_aq$enqueue_options_t as (
   visibility            integer,
   relative_msgid        bytea,
   sequence_deviation    integer,
   transformation        varchar(61),
   delivery_mode         integer
   );