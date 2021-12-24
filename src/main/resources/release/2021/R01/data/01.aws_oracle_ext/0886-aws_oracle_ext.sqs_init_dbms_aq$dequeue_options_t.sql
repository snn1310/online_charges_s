CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_init_dbms_aq$dequeue_options_t(consumer_name text DEFAULT NULL::text,
                                                                             dequeue_mode integer DEFAULT NULL::integer,
                                                                             navigation integer DEFAULT NULL::integer,
                                                                             visibility integer DEFAULT NULL::integer,
                                                                             wait integer DEFAULT NULL::integer,
                                                                             msgid bytea DEFAULT NULL::bytea,
                                                                             correlation text DEFAULT NULL::text,
                                                                             deq_condition text DEFAULT NULL::text,
                                                                             signature json DEFAULT NULL::json,
                                                                             transformation text DEFAULT NULL::text,
                                                                             delivery_mode integer DEFAULT NULL::integer)
 RETURNS aws_oracle_ext.dbms_aq$dequeue_options_t
 LANGUAGE sql
 IMMUTABLE
AS $function$ select (
consumer_name ,
coalesce(dequeue_mode, aws_oracle_ext.sqs_remove()),
coalesce(navigation,aws_oracle_ext.sqs_next_message()),
coalesce(visibility,aws_oracle_ext.sqs_on_commit()),
coalesce(wait, aws_oracle_ext.sqs_forever()),
msgid,
correlation,
deq_condition,
json_populate_record(null::aws_oracle_ext.SQS_aq$_sig_prop, signature),
transformation,
coalesce(delivery_mode, aws_oracle_ext.sqs_persistent())
                      )::aws_oracle_ext.dbms_aq$dequeue_options_t;$function$;