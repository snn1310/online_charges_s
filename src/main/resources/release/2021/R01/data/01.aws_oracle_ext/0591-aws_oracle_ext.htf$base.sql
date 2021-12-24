CREATE OR REPLACE FUNCTION aws_oracle_ext.htf$base
(
    ctarget IN TEXT DEFAULT NULL,
    cattributes IN TEXT DEFAULT NULL
)

RETURNS TEXT AS
$BODY$

    SELECT concat_ws('',
                     '<base',
                     aws_oracle_ext.htf$ifnotnull(ctarget, concat_ws('', ' target="', ctarget, '"')),
                     aws_oracle_ext.htf$ifnotnull(cattributes, concat_ws('', ' ', cattributes)),
                     ' href="',
                     case when aws_oracle_ext.owa_util$get_cgi_env('REQUEST_PROTOCOL') is null then 'http'
                          else lower('REQUEST_PROTOCOL')
                      end,
                     '://',
                     aws_oracle_ext.owa_util$get_cgi_env('SERVER_NAME'),
                     ':',
                     aws_oracle_ext.owa_util$get_cgi_env('SERVER_PORT'),
                     aws_oracle_ext.owa_util$get_cgi_env('SCRIPT_NAME'),
                     aws_oracle_ext.owa_util$get_cgi_env('PATH_INFO'),
                     '" />');

$BODY$
LANGUAGE SQL
IMMUTABLE;


