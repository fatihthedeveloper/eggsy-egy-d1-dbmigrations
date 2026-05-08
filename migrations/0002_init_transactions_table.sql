-- Migration number: 0002 	 2026-05-08T20:43:53.379Z
CREATE TABLE transactions (
    id TEXT PRIMARY KEY, -- Using UUIDs for edge-compatibility
    email TEXT,
    transactionDate TEXT NOT NULL, 
    amount INTEGER NOT NULL,
    currency TEXT DEFAULT 'USD',
    transactionType TEXT,
    merchantName TEXT,
    description TEXT,
    createdAt INTEGER DEFAULT (CAST((julianday('now') - 2440587.5) * 86400000 AS INTEGER)),
    updatedAt INTEGER DEFAULT (CAST((julianday('now') - 2440587.5) * 86400000 AS INTEGER)),

    FOREIGN KEY (email) REFERENCES Users(email) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
