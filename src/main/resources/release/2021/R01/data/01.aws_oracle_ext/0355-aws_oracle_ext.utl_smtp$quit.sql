/*
Subprogram to replace UTL_SMTP.quit
*/
CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_smtp$quit
(
    IN c aws_oracle_ext.utl_smtp$connection
)
RETURNS aws_oracle_ext.utl_smtp$reply
AS
$$
DECLARE 
    l_response JSON;
    l_reply aws_oracle_ext.utl_smtp$reply;
    l_message TEXT;
    l_sender TEXT;
    vto TEXT[];
    verror TEXT;
BEGIN

    SELECT sender,
        message,
        recipient_list
    INTO strict l_sender,
        l_message,
        vto
    FROM
    (     
        SELECT ct.sender,
        (
            SELECT STRING_AGG(msg_body, '') AS msg_body 
            FROM
            (
                SELECT msg_body
                FROM utl_smtp$new_message
                order by msg_part 
            ) r
        ) AS message,
        (
            SELECT ARRAY_AGG(address)
            FROM utl_smtp$recipients
        ) AS recipient_list
        FROM tutl_smtp$connection ct
       ) x;

    l_response := aws_oracle_ext.awslambda_fn
    (
        aws_oracle_ext.get_service_setting
        (
            'MAIL',
            'LAMBDA_ARN'
        ),
        JSON_BUILD_OBJECT
        (
            'service', 'ses',
            'args', JSON_BUILD_OBJECT
            (
                'Destinations', vto,
                'source', l_sender,
                'rawmessage', JSON_BUILD_OBJECT
                (
                    'Data', l_message
                )
            )
        )
    );

    verror := l_response ->> 'Error';

    IF  COALESCE(verror, '') <> '' THEN

        RAISE EXCEPTION 'Email sending failed: %', verror;

    END IF;

    l_reply.code := 221;
    l_reply.text := 'Service closing transmission channel';
    
    RETURN l_reply;

END;
$$
LANGUAGE plpgsql;