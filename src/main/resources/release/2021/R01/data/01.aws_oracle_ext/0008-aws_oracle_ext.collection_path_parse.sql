CREATE OR REPLACE FUNCTION aws_oracle_ext.collection_path_parse
(
    IN p INTERNAL
)
RETURNS VOID
AS
$BODY$
if (typeof(require) !== 'function') {
  const initColl = plv8.find_function("aws_oracle_ext.plv8_require");
  initColl();
}
const Pathparser = require('Pathparser');
const parser = new Pathparser(p);
return parser.getTokens();

$BODY$
LANGUAGE plv8;