CREATE TABLE ocsumm2.customer_gentime_20211005
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-10-04 00:00:00') TO ('2021-10-05 00:00:00');

