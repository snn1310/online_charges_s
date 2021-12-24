CREATE TABLE ocdetail.segment_detail_gentime_20211007
        PARTITION OF ocdetail.segment_detail
        FOR VALUES FROM ('2021-10-06 00:00:00') TO ('2021-10-07 00:00:00');

