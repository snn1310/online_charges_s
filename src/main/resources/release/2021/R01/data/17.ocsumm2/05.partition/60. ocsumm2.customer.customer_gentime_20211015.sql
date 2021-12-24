CREATE TABLE ocsumm2.customer_gentime_20211015
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');

