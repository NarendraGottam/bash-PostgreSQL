-- Function to insert a book
CREATE OR REPLACE FUNCTION add_book(
    p_title VARCHAR,
    p_subtitle VARCHAR,
    p_author VARCHAR,
    p_publisher VARCHAR
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO books (title, subtitle, author, publisher)
    VALUES (p_title, p_subtitle, p_author, p_publisher);
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION add_book(VARCHAR, VARCHAR, VARCHAR, VARCHAR) TO admin_user;
