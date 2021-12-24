CREATE TABLE ocdetail.session_detail_gentime_20211014
        PARTITION OF ocdetail.session_detail
        FOR VALUES FROM ('2021-10-13 00:00:00') TO ('2021-10-14 00:00:00');

