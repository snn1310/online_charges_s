CREATE TABLE ocdetail.session_detail_gentime_20211010
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-10-09 00:00:00') TO ('2021-10-10 00:00:00');

