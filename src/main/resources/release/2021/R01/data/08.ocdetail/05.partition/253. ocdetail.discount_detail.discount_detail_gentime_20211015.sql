CREATE TABLE ocdetail.discount_detail_gentime_20211015
        PARTITION OF ocdetail.discount_detail
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');

