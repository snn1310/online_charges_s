CREATE TABLE ocdetail.discount_detail_gentime_20210927
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-09-26 00:00:00') TO ('2021-09-27 00:00:00');

