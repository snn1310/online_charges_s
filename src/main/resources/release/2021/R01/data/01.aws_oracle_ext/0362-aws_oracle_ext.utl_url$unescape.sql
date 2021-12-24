CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_url$unescape(IN p_url TEXT,
                                                           IN p_url_charset TEXT DEFAULT NULL)
RETURNS TEXT
AS
$BODY$
DECLARE
   v_err_message TEXT;
   v_char_code TEXT;
   v_char_byte BYTEA;
   v_url_charset VARCHAR;
   v_decoded_url BYTEA := '';
BEGIN
   /* Requires functions to be installed in "aws_oracle_ext" schema:
      - get_charset_name.
    */

   -- Determining the charset for character decoding
   v_url_charset := CASE
                       WHEN p_url_charset IS NULL THEN pg_client_encoding()
                       ELSE aws_oracle_ext.get_charset_name(p_url_charset)
                    END;

   -- Iterating over all significant characters in the string
   FOR v_char_code IN
   (SELECT unnest(regexp_matches(p_url, '(%..|.)', 'g')) url_char)
   LOOP
      -- Unescaping "%XX" characters
      v_char_byte := CASE
                        WHEN v_char_code !~ '%' THEN v_char_code::BYTEA
                        ELSE decode(substring(v_char_code, 2, 2), 'hex')
                     END;

      -- Concatenating into resulting byte string
      v_decoded_url := v_decoded_url || v_char_byte;
   END LOOP;

   RETURN convert_from(v_decoded_url, v_url_charset);
EXCEPTION
   WHEN character_not_in_repertoire THEN
      GET STACKED DIAGNOSTICS v_err_message = MESSAGE_TEXT;

      RAISE USING MESSAGE := format('Failed to decode url byte string "%s" to %s charset (Oracle %s).',
                                    v_decoded_url::TEXT,
                                    upper(v_url_charset),
                                    upper(p_url_charset)),
                  DETAIL := concat(v_err_message, '.'),
                  HINT := format('Try to use another charset (not %s) or correct initial url string.',
                                 upper(p_url_charset));
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;

