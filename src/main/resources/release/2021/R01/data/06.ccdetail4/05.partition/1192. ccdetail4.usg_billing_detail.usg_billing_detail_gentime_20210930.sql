CREATE TABLE ccdetail4.usg_billing_detail_gentime_20210930
        PARTITION OF ccdetail4.usg_billing_detail
        FOR VALUES FROM ('2021-09-29 00:00:00') TO ('2021-09-30 00:00:00');

