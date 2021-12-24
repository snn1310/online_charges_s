CREATE OR REPLACE FUNCTION aws_oracle_ext."dbms_lob$constant"(p_const_name text)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE
AS $function$
declare l_consts jsonb = json_build_object(
							-- DBMS_LOB Constants - Basic
							'CALL',12,
							'FILE_READONLY',0,
							'LOB_READONLY',0,
							'LOB_READWRITE',1,
							-- 'LOBMAXSIZE',18446744073709551615 -> to long for INT-> aws_oracle_ext.dbms_lob$lobmaxsize,
							'SESSION',10,

							-- DBMS_LOB Constants - Option Types
							'OPT_COMPRESS',1,
							'OPT_DEDUPLICATE',4,
							'OPT_ENCRYPT',2,

							-- DBMS_LOB Constants - Option Values							
							'COMPRESS_OFF',0,
							'COMPRESS_ON',1,
							'DEDUPLICATE_OFF',0,
							'DEDUPLICATE_ON',4,
							'ENCRYPT_OFF',0,
							'ENCRYPT_ON',2,
							
							-- DBMS_LOB Constants - DBFS State Value Types
							'DBFS_LINK_NEVER',0,
							'DBFS_LINK_NO',2,
							'DBFS_LINK_YES',1,
							
							-- DBMS_LOB Constants - DBFS Cache Flags
							'DBFS_LINK_CACHE',1,
							'DBFS_LINK_NOCACHE',0,
							
							
							-- DBMS_LOB Constants - Miscellaneous
							'CONTENTTYPE_MAX_SIZE',128,
							'DBFS_LINK_PATH_MAX_SIZE',1024,
							
							'DEFAULT_CSID',0,
							'DEFAULT_LANG_CTX',0,
							'BLOBMAXSIZE',16777216,
							'CLOBMAXSIZE',4194304,
							'NO_WARNING',0,

							'TRANSACTION',11,
							'WARN_INCONVERTIBLE_CHAR',1

						);
begin
	if l_consts ?  upper(p_const_name) then
		return (l_consts->>upper(p_const_name))::integer;
	else 
		raise exception 'Unknown DBMS_LOB constant: %', p_const_name;
	end if;
end $function$
;