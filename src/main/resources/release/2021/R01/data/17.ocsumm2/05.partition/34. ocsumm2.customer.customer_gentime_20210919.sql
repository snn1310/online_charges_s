CREATE TABLE ocsumm2.customer_gentime_20210919
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-09-18 00:00:00') TO ('2021-09-19 00:00:00');

