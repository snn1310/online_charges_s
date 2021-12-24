CREATE TABLE ocdetail.session_detail_gentime_20210907
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-09-06 00:00:00') TO ('2021-09-07 00:00:00');

