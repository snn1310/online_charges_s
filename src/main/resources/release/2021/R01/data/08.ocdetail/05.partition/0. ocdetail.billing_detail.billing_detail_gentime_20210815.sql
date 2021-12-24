CREATE TABLE ocdetail.billing_detail_gentime_20210815
        PARTITION OF ocdetail.billing_detail
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

