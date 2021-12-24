CREATE TABLE ccdetail2.transaction_document_gentime_20210926
        PARTITION OF ccdetail2.transaction_document
        FOR VALUES FROM (MINVALUE) TO ('2021-09-26 00:00:00');

