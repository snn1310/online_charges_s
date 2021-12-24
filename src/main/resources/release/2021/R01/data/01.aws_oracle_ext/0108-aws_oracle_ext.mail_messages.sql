CREATE TABLE aws_oracle_ext.mail_messages
(
    id BIGINT NOT NULL DEFAULT nextval('aws_oracle_ext.mail_messages_id_seq')
    ,sender character varying(512)
    ,body text not null
    ,added_at timestamp with time zone not null default clock_timestamp()
    ,read_at timestamp with time zone
    ,processed_at timestamp with time zone
    ,error_text character varying
);
