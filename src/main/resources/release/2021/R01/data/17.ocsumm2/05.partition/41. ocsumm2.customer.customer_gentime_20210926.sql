CREATE TABLE ocsumm2.customer_gentime_20210926
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

