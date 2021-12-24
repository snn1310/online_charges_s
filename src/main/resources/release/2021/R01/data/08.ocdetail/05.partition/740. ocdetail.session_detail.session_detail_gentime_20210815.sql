CREATE TABLE ocdetail.session_detail_gentime_20210815
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM (MINVALUE) TO ('2021-08-15 00:00:00');

