CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_init_aq$_sig_prop(signature bytea DEFAULT NULL::bytea,
                                                                canalgo text DEFAULT NULL::text,
                                                                digalgo text DEFAULT NULL::text,
                                                                sigalgo text DEFAULT NULL::text,
                                                                certificate text DEFAULT NULL::text,
                                                                digval bytea DEFAULT NULL::bytea
                                                                )
 RETURNS aws_oracle_ext.sqs_aq$_sig_prop
 LANGUAGE sql
 IMMUTABLE
AS $function$ select (signature, canalgo, digalgo, sigalgo, certificate, digval)::aws_oracle_ext.SQS_aq$_sig_prop;
$function$;
