CREATE TABLE ocsumm2.customer_gentime_20210821
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-08-20 00:00:00') TO ('2021-08-21 00:00:00');

