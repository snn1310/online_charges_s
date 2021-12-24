CREATE TABLE IF NOT EXISTS aws_oracle_data.tdfmt
(
    dmodel VARCHAR(4000) NOT NULL,
    dmodelto VARCHAR(4000) NOT NULL,
    CONSTRAINT tdfmt_pkey PRIMARY KEY (dmodel)
);