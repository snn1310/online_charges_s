CREATE TABLE ccdetail4.segment_detail_gentime_20210913
        PARTITION OF ccdetail4.segment_detail
        FOR VALUES FROM ('2021-09-12 00:00:00') TO ('2021-09-13 00:00:00');

