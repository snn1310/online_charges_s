CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_init_dbms_aq$enqueue_options_t(visibility integer DEFAULT NULL::integer,
                                                                             relative_msgid bytea DEFAULT NULL::bytea,
                                                                             sequence_deviation integer DEFAULT NULL::integer,
                                                                             transformation text DEFAULT NULL::text,
                                                                             delivery_mode integer DEFAULT NULL::integer)
 RETURNS aws_oracle_ext.dbms_aq$enqueue_options_t
 LANGUAGE sql
 IMMUTABLE
AS $function$ select (coalesce(visibility, aws_oracle_ext.sqs_on_commit()),
                      relative_msgid, sequence_deviation, transformation,
                      coalesce(delivery_mode, aws_oracle_ext.sqs_persistent())
                      )::aws_oracle_ext.dbms_aq$enqueue_options_t;$function$;