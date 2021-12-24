CREATE TABLE IF NOT EXISTS aws_oracle_context.params (
	param_name text not null,
	param_value text not null,
	constraint pk_params primary key (param_name)
);