CREATE TABLE ocsumm2.customer_gentime_20210824
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-08-23 00:00:00') TO ('2021-08-24 00:00:00');

