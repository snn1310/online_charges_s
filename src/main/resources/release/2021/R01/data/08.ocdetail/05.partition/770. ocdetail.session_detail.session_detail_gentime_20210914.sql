CREATE TABLE ocdetail.session_detail_gentime_20210914
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-09-13 00:00:00') TO ('2021-09-14 00:00:00');

