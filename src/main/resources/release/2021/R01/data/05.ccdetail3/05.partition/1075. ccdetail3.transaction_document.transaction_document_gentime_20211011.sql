CREATE TABLE ccdetail3.transaction_document_gentime_20211011
        PARTITION OF ccdetail3.transaction_document
        FOR VALUES FROM ('2021-10-10 00:00:00') TO ('2021-10-11 00:00:00');

