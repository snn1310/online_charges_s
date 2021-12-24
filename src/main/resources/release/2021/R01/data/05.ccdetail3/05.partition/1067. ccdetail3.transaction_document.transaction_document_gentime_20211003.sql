CREATE TABLE ccdetail3.transaction_document_gentime_20211003
        PARTITION OF ccdetail3.transaction_document
        FOR VALUES FROM ('2021-10-02 00:00:00') TO ('2021-10-03 00:00:00');

