create type aws_oracle_ext.sqs_aq$_sig_prop as (
    signature   bytea,
    canalgo     varchar(2000),
    digalgo     varchar(2000),
    sigalgo     varchar(2000),
    certificate varchar(2000),
    digval      bytea
);