CREATE TABLE ccdetail1.segment_detail_gentime_20210928
        PARTITION OF ccdetail1.segment_detail
        FOR VALUES FROM ('2021-09-27 00:00:00') TO ('2021-09-28 00:00:00');

