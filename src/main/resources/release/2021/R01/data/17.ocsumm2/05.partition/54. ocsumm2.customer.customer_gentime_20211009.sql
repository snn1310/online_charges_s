CREATE TABLE ocsumm2.customer_gentime_20211009
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-10-08 00:00:00') TO ('2021-10-09 00:00:00');

