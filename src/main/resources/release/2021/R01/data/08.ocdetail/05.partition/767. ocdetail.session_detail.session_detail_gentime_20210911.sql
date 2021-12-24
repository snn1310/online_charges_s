CREATE TABLE ocdetail.session_detail_gentime_20210911
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-09-10 00:00:00') TO ('2021-09-11 00:00:00');

