CREATE TABLE ocdetail.discount_detail_gentime_20210912
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-09-11 00:00:00') TO ('2021-09-12 00:00:00');

