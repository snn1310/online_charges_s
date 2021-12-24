CREATE OR REPLACE FUNCTION aws_oracle_ext.utl_url$escape(IN p_url TEXT,
                                                         IN p_escape_reserved BOOLEAN DEFAULT FALSE,
                                                         IN p_url_charset TEXT DEFAULT NULL)
RETURNS TEXT
AS
$BODY$
DECLARE
   v_err_message TEXT;
   v_encoded_url TEXT;
   v_temp_char VARCHAR;
   v_char_reqexp VARCHAR;
   v_url_charset VARCHAR;
   v_ascii_val INTEGER;
   v_temp_charcode BYTEA;
BEGIN
   /* Requires functions to be installed in "aws_oracle_ext" schema:
      - get_charset_name.
    */

   -- Determining the set of unescapable characters
   v_char_reqexp := CASE
                       WHEN p_escape_reserved THEN '[0-9a-zA-Z\-_.!~*`()]+'
                       ELSE '[0-9a-zA-Z\-_.!~*`();/?:@&=+$,\[\]]+'
                    END;

   -- Determining the charset for character encoding
   v_url_charset := CASE
                       WHEN p_url_charset IS NULL THEN pg_client_encoding()
                       ELSE aws_oracle_ext.get_charset_name(p_url_charset)
                    END;

   -- Iterating over all characters in the string
   FOR i_charpos IN 1..char_length(coalesce(p_url, ''))
   LOOP
      v_temp_char := substr(p_url, i_charpos, 1);

      -- Skipping unescapable characters and convert others
      IF (v_temp_char ~ v_char_reqexp) THEN
         v_encoded_url := concat(v_encoded_url, v_temp_char);
      ELSE
         -- Encoding character to selected charset
         v_temp_charcode := convert_to(v_temp_char, v_url_charset);
         
         -- Casting each character byte to hex and escaping it with "%"
         FOR i_charcode IN 1..octet_length(v_temp_charcode)
         LOOP
            v_temp_char := upper(encode(substring(v_temp_charcode, i_charcode, 1), 'hex'));
            v_encoded_url := concat(v_encoded_url, '%', v_temp_char);
         END LOOP;
      END IF;
   END LOOP;

   RETURN v_encoded_url;
EXCEPTION
   WHEN untranslatable_character THEN
      GET STACKED DIAGNOSTICS v_err_message = MESSAGE_TEXT;

      RAISE USING MESSAGE := format('Failed to encode character "%s" to %s charset (Oracle %s).',
                                    v_temp_char,
                                    upper(v_url_charset),
                                    upper(p_url_charset)),
                  DETAIL := concat(v_err_message, '.'),
                  HINT := format('Try to use another charset (not %s) in order to encode mentioned character (symbol).',
                                 upper(p_url_charset));
END;
$BODY$
LANGUAGE plpgsql
VOLATILE;

