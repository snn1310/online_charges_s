CREATE TABLE ccdetail1.segment_detail_gentime_20210830
        PARTITION OF ccdetail1.segment_detail
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

