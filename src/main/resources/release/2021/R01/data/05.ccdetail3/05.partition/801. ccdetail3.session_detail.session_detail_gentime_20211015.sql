CREATE TABLE ccdetail3.session_detail_gentime_20211015
        PARTITION OF ccdetail3.session_detail
        FOR VALUES FROM ('2021-10-14 00:00:00') TO ('2021-10-15 00:00:00');

