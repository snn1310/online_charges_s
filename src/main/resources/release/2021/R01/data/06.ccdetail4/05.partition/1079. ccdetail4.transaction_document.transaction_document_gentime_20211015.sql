CREATE TABLE ccdetail4.transaction_document_gentime_20211015
        PARTITION OF ccdetail4.transaction_document
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');

