CREATE TABLE ocdetail.transaction_document_gentime_20211016
        PARTITION OF ocdetail.transaction_document
        FOR VALUES FROM ('2021-10-15 00:00:00') TO ('2021-10-16 00:00:00');

