create type aws_oracle_ext.dbms_aq$dequeue_options_t as (
    consumer_name  varchar(30),
    dequeue_mode   integer,
    navigation     integer,
    visibility     integer,
    wait           integer,
    msgid          bytea,
    correlation    varchar(128),
    deq_condition  varchar(4000),
    signature      aws_oracle_ext.sqs_aq$_sig_prop,
    transformation varchar(60),
    delivery_mode  integer
);