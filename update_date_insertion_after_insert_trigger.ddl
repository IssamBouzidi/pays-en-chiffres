CREATE OR REPLACE FUNCTION update_date_insertion() RETURNS trigger AS
$BODY$
BEGIN
	UPDATE countries
	SET date_insertion = (SELECT NOW()::timestamp(0) AT TIME ZONE 'Etc/GMT+2')
	WHERE id_country = NEW.id_country;
    RETURN new; 
END;
$BODY$
 LANGUAGE plpgsql VOLATILE;
 
CREATE TRIGGER update_date_insertion_trigger
	AFTER INSERT
	ON countries
	FOR EACH ROW
	EXECUTE PROCEDURE update_date_insertion();