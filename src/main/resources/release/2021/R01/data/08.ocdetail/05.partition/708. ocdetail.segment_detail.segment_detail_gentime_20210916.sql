CREATE TABLE ocdetail.segment_detail_gentime_20210916
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-09-15 00:00:00') TO ('2021-09-16 00:00:00');

