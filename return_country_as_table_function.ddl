drop function get_country;
CREATE FUNCTION get_country(country_name varchar) RETURNS SETOF countries AS
$BODY$
BEGIN
    RETURN QUERY SELECT *
                  FROM countries
                  WHERE lower(country) like lower(country_name);

    -- Since execution is not finished, we can check whether rows were returned
    -- and raise exception if not.
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No country found %.', $1;
    END IF;

    RETURN;
 END
$BODY$
LANGUAGE plpgsql;

select * from get_country('Nigeria');