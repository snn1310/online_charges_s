create index i_mail_messages_new
    on aws_oracle_ext.mail_messages(id)
    where read_at is null;