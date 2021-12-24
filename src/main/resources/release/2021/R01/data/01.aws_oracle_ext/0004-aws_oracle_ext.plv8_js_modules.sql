CREATE TABLE aws_oracle_ext.plv8_js_modules
(
    module TEXT UNIQUE PRIMARY KEY,
    autoload BOOL DEFAULT FALSE,
    source TEXT
);