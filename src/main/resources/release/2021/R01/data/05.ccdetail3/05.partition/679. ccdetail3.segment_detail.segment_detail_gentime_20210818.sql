CREATE TABLE ccdetail3.segment_detail_gentime_20210818
        PARTITION OF ccdetail3.segment_detail
        FOR VALUES FROM ('2021-08-17 00:00:00') TO ('2021-08-18 00:00:00');

