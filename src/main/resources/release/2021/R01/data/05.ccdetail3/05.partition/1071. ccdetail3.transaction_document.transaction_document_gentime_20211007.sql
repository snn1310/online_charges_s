CREATE TABLE ccdetail3.transaction_document_gentime_20211007
        PARTITION OF ccdetail3.transaction_document
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');

