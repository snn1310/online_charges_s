CREATE TABLE ocdetail.segment_detail_gentime_20211006
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-10-05 00:00:00') TO ('2021-10-06 00:00:00');

