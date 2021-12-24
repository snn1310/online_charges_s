comment on table aws_oracle_ext.mail_messages is 'Mail messages with their statuses';
comment on column aws_oracle_ext.mail_messages.id is 'Message Id';
comment on column aws_oracle_ext.mail_messages.sender is 'Sender''s address';
comment on column aws_oracle_ext.mail_messages.body is 'Raw message''s body with all the headers, ';
comment on column aws_oracle_ext.mail_messages.added_at is 'When the message was added';
comment on column aws_oracle_ext.mail_messages.read_at is 'When the message went to sending process';
comment on column aws_oracle_ext.mail_messages.processed_at is 'When the message left the sending';
comment on column aws_oracle_ext.mail_messages.error_text is 'Error message if any occurred during the process';
