/*
  Function to invoke AWS Lambda functions

  Parameters:
    fn_name -- ARN of AWS Lambda function to invoke
    fn_args -- JSON value for the event parameter of the invoked function
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.awslambda_fn (
  fn_name TEXT,
  fn_args JSON
)
RETURNS JSON as
$BODY$
  SELECT payload 
  FROM aws_lambda.invoke
  (
    fn_name,
    fn_args
  );
 $BODY$
LANGUAGE SQL;
