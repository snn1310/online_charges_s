CREATE TABLE IF NOT EXISTS aws_oracle_data.dfmt
(
    dmodel VARCHAR(4000) NOT NULL,
    dmodelto VARCHAR(4000) NOT NULL,
    CONSTRAINT dfmt_pkey PRIMARY KEY (dmodel)
);