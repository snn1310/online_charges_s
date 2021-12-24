CREATE TABLE IF NOT EXISTS aws_oracle_ext.directory
(
    directory_name TEXT NOT NULL,
    s3bucket TEXT NOT NULL,
    CONSTRAINT pk_aws_directory PRIMARY KEY(directory_name)
);