create or replace function aws_oracle_ext.DBMS_TYPES(in TYPECODE character varying) returns integer as
$BODY$
DECLARE
  l_typecodes json = '{"TYPECODE_DATE":"12" 
		       ,"TYPECODE_NUMBER":"2"
		       ,"TYPECODE_RAW":"95"
		       ,"TYPECODE_CHAR":"96"
		       ,"TYPECODE_VARCHAR2":"9"
		       ,"TYPECODE_VARCHAR":"1"
		       ,"TYPECODE_MLSLABEL":"105"
		       ,"TYPECODE_BLOB":"113"
		       ,"TYPECODE_BFILE":"114"
		       ,"TYPECODE_CLOB":"112"
		       ,"TYPECODE_CFILE":"115"
		       ,"TYPECODE_TIMESTAMP":"187"
		       ,"TYPECODE_TIMESTAMP_TZ":"188"
		       ,"TYPECODE_TIMESTAMP_LTZ":"232"
		       ,"TYPECODE_INTERVAL_YM":"189"
		       ,"TYPECODE_INTERVAL_DS":"190"
		       ,"TYPECODE_REF":"110"
		       ,"TYPECODE_OBJECT":"108"
		       ,"TYPECODE_VARRAY":"247"
		       ,"TYPECODE_TABLE":"248"
		       ,"TYPECODE_NAMEDCOLLECTION":"122"
		       ,"TYPECODE_OPAQUE":"58"
		       ,"TYPECODE_NCHAR":"286"
		       ,"TYPECODE_NVARCHAR2":"287"
		       ,"TYPECODE_NCLOB":"288"
		       ,"TYPECODE_BFLOAT":"100"
		       ,"TYPECODE_BDOUBLE":"101"
		       ,"TYPECODE_UROWID":"104"
		       ,"SUCCESS":"0"
		       ,"NO_DATA":"100"
		       ,"oidvector":"247"
		       ,"int2vector":"247"		       		       
		       ,"date":"12"
		       ,"timestamptz":"188"		       		       
		       ,"timestamp":"187"
		       ,"numeric":"2"		       		       
		       ,"int8":"2"
		       ,"int4":"2"		       		       
		       ,"int2":"2"
		       ,"oid":"2"		       		       
		       ,"float4":"2"
		       ,"float8":"2"		       		       
		       ,"money":"2"
		       ,"varchar":"9"		       		       
		       ,"text":"112"
		       ,"bpchar":"96"		       		       
		       ,"interval":"189"		       		       
		       ,"tinterval":"189"
		       ,"varbit":"9"		       		       
		       ,"bit":"96"
		       ,"bytea":"112"		       		       
		       }'; 
BEGIN
  return l_typecodes->>TYPECODE;
END;
$BODY$
LANGUAGE plpgsql IMMUTABLE;