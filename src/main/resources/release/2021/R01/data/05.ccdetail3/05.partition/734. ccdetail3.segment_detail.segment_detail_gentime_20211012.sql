CREATE TABLE ccdetail3.segment_detail_gentime_20211012
        PARTITION OF ccdetail3.segment_detail
        FOR VALUES FROM ('2021-10-11 00:00:00') TO ('2021-10-12 00:00:00');

