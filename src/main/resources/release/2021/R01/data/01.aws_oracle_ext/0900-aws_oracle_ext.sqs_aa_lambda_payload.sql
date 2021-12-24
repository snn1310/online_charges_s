CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_aa_lambda_payload(fn_name text, fn_args text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
begin
	return aws_oracle_ext.awslambda_fn(fn_name, fn_args::json)::text;
end;
$function$
