CREATE TABLE ocsumm2.customer_gentime_20210922
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-09-21 00:00:00') TO ('2021-09-22 00:00:00');

