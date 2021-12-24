CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_init_aq$_agent(name text DEFAULT NULL::text,
                                                            address text DEFAULT NULL::text,
                                                            protocol double precision DEFAULT NULL::double precision
                                                            )
 RETURNS aws_oracle_ext.sqs_aq$_agent
 LANGUAGE sql
 IMMUTABLE
AS $function$ select (name, address, coalesce(protocol, 0)):: aws_oracle_ext.SQS_AQ$_AGENT;$function$;
