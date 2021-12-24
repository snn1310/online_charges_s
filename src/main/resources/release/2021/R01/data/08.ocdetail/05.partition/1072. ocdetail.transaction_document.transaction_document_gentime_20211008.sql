CREATE TABLE ocdetail.transaction_document_gentime_20211008
        PARTITION OF ocdetail.transaction_document
        FOR VALUES FROM ('2021-10-07 00:00:00') TO ('2021-10-08 00:00:00');

