CREATE TABLE ccdetail4.usg_billing_detail_gentime_20210828
        PARTITION OF ccdetail4.usg_billing_detail
        FOR VALUES FROM ('2021-08-27 00:00:00') TO ('2021-08-28 00:00:00');

