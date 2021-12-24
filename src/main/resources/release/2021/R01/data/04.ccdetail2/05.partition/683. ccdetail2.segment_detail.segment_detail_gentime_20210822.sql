CREATE TABLE ccdetail2.segment_detail_gentime_20210822
        PARTITION OF ccdetail2.segment_detail
        FOR VALUES FROM ('2021-08-21 00:00:00') TO ('2021-08-22 00:00:00');

