CREATE TABLE ccdetail4.transaction_document_gentime_20211010
        PARTITION OF ccdetail4.transaction_document
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

