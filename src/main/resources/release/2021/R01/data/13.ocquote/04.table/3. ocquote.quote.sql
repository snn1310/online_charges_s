CREATE TABLE ocquote.quote(
    q_id CHARACTER VARYING(33) NOT NULL,
    q_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    q_domain CHARACTER VARYING(15) NOT NULL
)
        WITH (
        OIDS=FALSE
        );

