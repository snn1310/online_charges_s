CREATE TABLE ccdetail4.transaction_document_gentime_20211013
        PARTITION OF ccdetail4.transaction_document
        FOR VALUES FROM ('2021-10-12 00:00:00') TO ('2021-10-13 00:00:00');

