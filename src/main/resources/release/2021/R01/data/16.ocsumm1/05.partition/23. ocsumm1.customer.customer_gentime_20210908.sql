CREATE TABLE ocsumm1.customer_gentime_20210908
        PARTITION OF ocsumm1.customer
        FOR VALUES FROM ('2021-09-07 00:00:00') TO ('2021-09-08 00:00:00');
