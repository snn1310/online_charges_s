CREATE OR REPLACE FUNCTION aws_oracle_ext.sqs_init_dbms_aq$message_properties_t(
        priority integer DEFAULT NULL::integer,
        delay integer DEFAULT NULL::integer,
        expiration integer DEFAULT NULL::integer,
        correlation text DEFAULT NULL::text,
        attempts integer DEFAULT NULL::integer,
        recipient_list json DEFAULT NULL::json,
        exception_queue text DEFAULT NULL::text,
        enqueue_time timestamp without time zone DEFAULT NULL::timestamp without time zone,
        state integer DEFAULT NULL::integer,
        sender_id json DEFAULT NULL::json,
        original_msgid bytea DEFAULT NULL::bytea,
        signature json DEFAULT NULL::json,--sqs_aq_sig_prop,
        transaction_group      text default null,
        user_property          text default null,
        delivery_mode          integer default null
)
 RETURNS aws_oracle_ext.dbms_aq$message_properties_t
 LANGUAGE sql
 IMMUTABLE
AS $function$ select (
coalesce(priority,1),
coalesce(delay, aws_oracle_ext.sqs_no_delay()),
coalesce(expiration, aws_oracle_ext.sqs_never()),
correlation,
attempts,
recipient_list,
exception_queue,
enqueue_time,
state,
json_populate_record(null::aws_oracle_ext.sqs_aq$_agent, sender_id),
original_msgid,
json_populate_record(null::aws_oracle_ext.sqs_aq$_sig_prop, signature),
transaction_group,
user_property,
coalesce(delivery_mode, aws_oracle_ext.sqs_persistent())
)::aws_oracle_ext.dbms_aq$message_properties_t;$function$