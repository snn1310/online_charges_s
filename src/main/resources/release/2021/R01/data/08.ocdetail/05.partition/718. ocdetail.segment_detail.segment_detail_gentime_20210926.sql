CREATE TABLE ocdetail.segment_detail_gentime_20210926
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-09-25 00:00:00') TO ('2021-09-26 00:00:00');

