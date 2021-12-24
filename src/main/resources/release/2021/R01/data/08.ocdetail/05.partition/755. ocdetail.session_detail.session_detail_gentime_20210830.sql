CREATE TABLE ocdetail.session_detail_gentime_20210830
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-08-29 00:00:00') TO ('2021-08-30 00:00:00');

