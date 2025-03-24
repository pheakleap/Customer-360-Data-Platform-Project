-- 1. Find High-Value Customers (Top Depositors)
SELECT c.first_name, c.last_name, SUM(t.amount) AS total_deposits
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Deposit'
GROUP BY c.customer_id
ORDER BY total_deposits DESC
LIMIT 10;

-- 2. Find Customers with High Loan Default Risk
SELECT c.first_name, c.last_name, l.loan_amount, l.interest_rate, l.loan_status
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE l.loan_status = 'Defaulted'
ORDER BY l.loan_amount DESC;

-- 3. Identify Fraudulent Accounts
SELECT c.first_name, c.last_name, f.incident_type, f.incident_date, f.status
FROM customers c
JOIN fraud_incidents f ON c.customer_id = f.customer_id
ORDER BY f.incident_date DESC;

-- 4. Identify Customers with Frequent Transactions
SELECT c.first_name, c.last_name, COUNT(t.transaction_id) AS transaction_count
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id
ORDER BY transaction_count DESC
LIMIT 10;

-- 5. Customers with High Overdraft Usage
SELECT c.first_name, c.last_name, a.account_balance, COUNT(t.transaction_id) AS overdraft_count
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE a.account_balance < 0
GROUP BY c.customer_id, a.account_balance
ORDER BY overdraft_count DESC
LIMIT 10;

-- 6. Average Transaction Value per Customer
SELECT c.first_name, c.last_name, AVG(t.amount) AS avg_transaction_value
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id
ORDER BY avg_transaction_value DESC
LIMIT 10;

-- 7. Most Common Support Ticket Issues
SELECT issue_type, COUNT(*) AS issue_count
FROM support_tickets
GROUP BY issue_type
ORDER BY issue_count DESC;




