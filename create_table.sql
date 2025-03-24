CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS accounts (
    account_id VARCHAR(255) NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    account_type VARCHAR(255) NOT NULL,
    account_balance FLOAT NOT NULL,
    currency VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (account_id, customer_id)
);

CREATE TABLE IF NOT EXISTS fraud_incidents (
    incident_id VARCHAR(255) NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    incident_type VARCHAR(255) NOT NULL,
    incident_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY (incident_id, customer_id)
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id VARCHAR(255) NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    loan_type VARCHAR(255) NOT NULL,
    loan_amount FLOAT NOT NULL,
    interest_rate FLOAT NOT NULL,
    loan_status VARCHAR(255) NOT NULL,
    due_date DATE NOT NULL,
    PRIMARY KEY (loan_id, customer_id)
);

CREATE TABLE IF NOT EXISTS support_tickets (
    ticket_id VARCHAR(255) NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    issue_type VARCHAR(255) NOT NULL,    
    status VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT null default CURRENT_TIMESTAMP,
    PRIMARY KEY (ticket_id, customer_id)
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id VARCHAR(255) NOT NULL,
    account_id VARCHAR(255) NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    amount FLOAT NOT NULL,    
    transaction_date TIMESTAMP NOT null default current_TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY (transaction_id, account_id)
);