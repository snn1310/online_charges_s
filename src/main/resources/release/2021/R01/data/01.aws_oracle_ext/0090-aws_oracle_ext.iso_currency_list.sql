CREATE TABLE aws_oracle_ext.iso_currency_list
(
    code VARCHAR(3) NOT NULL,
    nls_iso_currency VARCHAR(128) NOT NULL,
    CONSTRAINT iso_cur_code_pk PRIMARY KEY(code),
    CONSTRAINT nls_iso_currency_uk UNIQUE(nls_iso_currency)
);