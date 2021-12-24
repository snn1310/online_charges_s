CREATE TABLE ccdetail4.segment_detail_gentime_20210910
        PARTITION OF ccdetail4.segment_detail
        FOR VALUES FROM ('2021-09-09 00:00:00') TO ('2021-09-10 00:00:00');

