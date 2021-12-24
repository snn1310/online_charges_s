/*
Domain type to replace an UTL_SMTP.replies
*/
create domain aws_oracle_ext.utl_smtp$replies
as
  aws_oracle_ext.utl_smtp$reply[];