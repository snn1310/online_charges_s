CREATE TABLE ocdetail.segment_detail_gentime_20210904
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-09-03 00:00:00') TO ('2021-09-04 00:00:00');

