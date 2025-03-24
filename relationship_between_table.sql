-- Check if customers are correctly inserted
SELECT * FROM customers LIMIT 5;

-- Verify relationships between accounts and customers
SELECT c.first_name, c.last_name, a.account_type, a.account_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
LIMIT 5;

-- Check transactions linked to accounts
SELECT t.transaction_id, t.transaction_type, t.amount, a.account_id
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
LIMIT 5;

-- Check laons linked to customers
SELECT c.phone, l.loan_type, l.loan_amount
FROM loans l
JOIN customers c ON l.customer_id   = c.customer_id
LIMIT 5;

