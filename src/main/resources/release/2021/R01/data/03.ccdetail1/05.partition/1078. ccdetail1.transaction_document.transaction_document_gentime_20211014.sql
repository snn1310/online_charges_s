CREATE TABLE ccdetail1.transaction_document_gentime_20211014
        PARTITION OF ccdetail1.transaction_document
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

