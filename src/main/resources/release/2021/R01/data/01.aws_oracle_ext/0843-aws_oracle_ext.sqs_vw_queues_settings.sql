CREATE OR REPLACE VIEW aws_oracle_ext.sqs_vw_queues_settings
AS SELECT s.qname,
    s.qpurename,
    s.url,
    s.arn,
    s.qtype,
    t.tschema,
    t.tname,
    t.tdatatypeschema,
    t.tdatatypename,
    concat('"', t.tschema, '"', '.', '"', t.tname, '"') AS quoted_table_name,
    concat('"', t.tdatatypeschema, '"', '.', '"', t.tdatatypename, '"') AS quoted_data_type
   FROM aws_oracle_ext.sqs_queues_settings s
     JOIN aws_oracle_ext.sqs_queues_tables t ON s.tableid = t.id;