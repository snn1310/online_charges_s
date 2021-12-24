CREATE TABLE ocdetail.segment_detail_gentime_20210920
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-09-19 00:00:00') TO ('2021-09-20 00:00:00');

