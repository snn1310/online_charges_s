CREATE TABLE ocsumm2.customer_gentime_20210901
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-08-31 00:00:00') TO ('2021-09-01 00:00:00');

