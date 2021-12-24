CREATE TABLE ccdetail3.session_detail_gentime_20210828
        PARTITION OF ccdetail3.session_detail
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

