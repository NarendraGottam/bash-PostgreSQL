-- View for summary
CREATE OR REPLACE VIEW book_summary AS
SELECT title, author FROM books;

GRANT SELECT ON book_summary TO view_user;
