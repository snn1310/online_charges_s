CREATE TABLE ocsumm1.customer_gentime_20210822
        PARTITION OF ocsumm1.customer
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

