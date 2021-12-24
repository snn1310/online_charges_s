CREATE TABLE ccdetail4.transaction_usage(
    tu_id CHARACTER VARYING(33) NOT NULL,
    sgd_id CHARACTER VARYING(33) NOT NULL,
    tu_session_start_date TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    tu_tran_type CHARACTER VARYING(18) NOT NULL,
    tu_database_name CHARACTER VARYING(18) NOT NULL,
    tu_timestamp TIMESTAMP(6) WITHOUT TIME ZONE NOT NULL,
    tu_tran_cnt INTEGER NOT NULL,
    tu_line_cnt INTEGER NOT NULL,
    tu_page_cnt INTEGER NOT NULL,
    tu_results_ind CHARACTER(1) NOT NULL,
    tu_result_cnt INTEGER NOT NULL,
    tu_meter_code CHARACTER(1) NOT NULL,
    tu_udm_ind CHARACTER(1),
    tu_udm_db_cnt SMALLINT,
    tu_udm_id CHARACTER VARYING(33),
    tu_comp_code CHARACTER(1),
    tu_access_method CHARACTER VARYING(3),
    tu_request_source CHARACTER VARYING(4),
    tu_request_ver CHARACTER VARYING(4),
    tu_reason_codes CHARACTER VARYING(10),
    tu_trail_code CHARACTER(1),
    tu_format_code CHARACTER VARYING(3),
    tu_dest_code CHARACTER VARYING(3),
    tu_frequency_code CHARACTER VARYING(3),
    tu_search_type CHARACTER VARYING(3),
    tu_find_type CHARACTER VARYING(2),
    tu_unique_code CHARACTER(1),
    tu_repeat_code CHARACTER(1),
    tu_billing_option CHARACTER(1) NOT NULL,
    tu_tran_id CHARACTER VARYING(33),
    tu_doc_id CHARACTER VARYING(33),
    tu_doc_name CHARACTER VARYING(80),
    tu_doc_pcnt NUMERIC(9,8) NOT NULL,
    tu_doc_origin CHARACTER VARYING(3),
    tu_doc_type CHARACTER VARYING(6),
    tu_query_text CHARACTER VARYING(4000),
    tu_ov_flag CHARACTER(1),
    tu_price_code CHARACTER VARYING(4),
    tu_software_type CHARACTER VARYING(2),
    tu_software_ver CHARACTER VARYING(4),
    tu_onl_serv_type CHARACTER VARYING(4),
    tu_reprint_cnt INTEGER NOT NULL,
    tu_reprint_ind CHARACTER(1) NOT NULL,
    tu_group_type CHARACTER VARYING(18),
    tu_group_id CHARACTER VARYING(33),
    tu_tier_ind CHARACTER(1) NOT NULL,
    tu_tier_code CHARACTER VARYING(3),
    tu_tier_id CHARACTER VARYING(33),
    tu_tier_count INTEGER NOT NULL,
    tu_confirm_num CHARACTER VARYING(9),
    tu_date_submitted TIMESTAMP(0) WITHOUT TIME ZONE,
    tu_part_cnt INTEGER NOT NULL,
    tu_command_type CHARACTER VARYING(18),
    tu_copy_cnt SMALLINT NOT NULL,
    tu_encryption_key CHARACTER VARYING(32),
    tu_folder_code CHARACTER(1),
    tu_rank INTEGER,
    tu_matter_reference CHARACTER VARYING(80),
    tu_encrypted_document_name CHARACTER VARYING(192),
    tu_quote_item_id CHARACTER VARYING(33),
    tu_note CHARACTER VARYING(50),
    tu_encrypted_doc_id CHARACTER VARYING(120),
    tu_long_encrypted_query_text TEXT
)
    PARTITION BY RANGE (tu_session_start_date)
        WITH (
        OIDS=FALSE
        );
COMMENT ON TABLE ccdetail4.transaction_usage
     IS 'Transaction Usage';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_id
     IS 'Generated id.';
COMMENT ON COLUMN ccdetail4.transaction_usage.sgd_id
     IS 'Generated id.  Links to segment detail table.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_session_start_date
     IS 'Session start date, used for partitioning.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tran_type
     IS 'Transaction type.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_database_name
     IS 'Database name.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_timestamp
     IS 'Search transaction timestamp.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tran_cnt
     IS 'Search transaction count.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_line_cnt
     IS 'Line count.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_page_cnt
     IS 'Page count.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_results_ind
     IS 'Results indicator.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_result_cnt
     IS 'Results count.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_meter_code
     IS 'Meter code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_udm_ind
     IS 'User defined multibase indicator.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_udm_db_cnt
     IS 'User defined multibase count.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_udm_id
     IS 'User defined multibase code (set to sequence number).';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_comp_code
     IS 'Completion code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_access_method
     IS 'Access method.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_request_source
     IS 'Request source.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_request_ver
     IS 'Request source version.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_reason_codes
     IS 'Permissible use search reason code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_trail_code
     IS 'Revisited indicator.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_format_code
     IS 'Format code (sub usage type).';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_dest_code
     IS 'Destination code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_frequency_code
     IS 'Alert frequency code (sub usage type).';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_search_type
     IS 'Search type.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_find_type
     IS 'Find type.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_unique_code
     IS 'Unique code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_repeat_code
     IS 'Repeat code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_billing_option
     IS 'Billing option.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tran_id
     IS 'Transaction id.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_doc_id
     IS 'Document id.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_doc_name
     IS 'Document name.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_doc_pcnt
     IS 'Document percent of whole.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_doc_origin
     IS 'Document origin.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_doc_type
     IS 'Document type.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_query_text
     IS 'Search query text.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_ov_flag
     IS 'Override flag.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_price_code
     IS 'Price code.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_software_type
     IS 'The type of software used to gather the print transaction.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_software_ver
     IS 'The version of software used to gather the print transaction.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_onl_serv_type
     IS 'The type of service used to gather the print transaction.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_reprint_cnt
     IS 'The number of resubmissions for a print transaction.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_reprint_ind
     IS 'The indicator for print resubmissions.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_group_type
     IS 'The document grouping type.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_group_id
     IS 'The document grouping identifier.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tier_ind
     IS 'Indicates if a tier applies to this usage.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tier_code
     IS 'What type of tier this usage is.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tier_id
     IS 'Links this usage to other usage in this tier.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_tier_count
     IS 'How many usage items are in the tier.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_confirm_num
     IS 'Search confirmation number.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_date_submitted
     IS 'Date search was submitted.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_part_cnt
     IS 'The number of document parts logged on the usage event.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_command_type
     IS 'Command Type for usage type P9.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_copy_cnt
     IS 'Count of print copies';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_encryption_key
     IS 'Encrypted query key';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_encrypted_doc_id
     IS 'An encrypted doc id.';
COMMENT ON COLUMN ccdetail4.transaction_usage.tu_long_encrypted_query_text
     IS 'Full encrypted query text';

