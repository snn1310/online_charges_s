CREATE TABLE ccdetail3.transaction_document_gentime_20210927
        PARTITION OF ccdetail3.transaction_document
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

