CREATE TABLE ocsumm1.customer_gentime_20211004
        PARTITION OF ocsumm1.customer
        FOR VALUES FROM ('2021-10-03 00:00:00') TO ('2021-10-04 00:00:00');

