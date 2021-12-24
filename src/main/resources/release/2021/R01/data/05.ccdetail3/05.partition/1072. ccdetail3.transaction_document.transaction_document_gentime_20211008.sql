CREATE TABLE ccdetail3.transaction_document_gentime_20211008
        PARTITION OF ccdetail3.transaction_document
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

