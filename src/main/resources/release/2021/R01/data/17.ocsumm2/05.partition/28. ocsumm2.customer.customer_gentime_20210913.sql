CREATE TABLE ocsumm2.customer_gentime_20210913
        PARTITION OF ocsumm2.customer
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');

