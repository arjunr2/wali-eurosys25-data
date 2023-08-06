SELECT * FROM tracks ORDER BY AlbumId;
SELECT FirstName LastName FROM customers ORDER BY Email LIMIT 10;
SELECT * FROM invoice_items INNER JOIN invoices ON invoice_items.InvoiceId=invoices.InvoiceId;
SELECT * FROM tracks WHERE Name LIKE '%i%';
