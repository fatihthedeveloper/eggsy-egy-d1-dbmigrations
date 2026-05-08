-- Migration number: 0001 	 2026-05-07T23:18:11.553Z
CREATE TABLE Users (
    -- PK indicates Primary Key. In SQLite, this implies TEXT is UNIQUE.
    email TEXT PRIMARY KEY,
    
    -- A secret is typically a text string (like a hashed password).
    secret TEXT,
    
    -- "epoch milliseconds" means a very large integer.
    -- SQLite's INTEGER handles up to 64-bit signed integers, which is required.
    createdAt INTEGER DEFAULT (CAST((julianday('now') - 2440587.5) * 86400000 AS INTEGER)),

    lastUpdatedAt INTEGER DEFAULT (CAST((julianday('now') - 2440587.5) * 86400000 AS INTEGER)),
    
    -- "boolean": SQLite does not have a native BOOLEAN type.
    -- It uses INTEGER (0 for false, 1 for true).
    banned INTEGER DEFAULT 0,

    -- This constraint enforces the boolean behavior (0 or 1).
    CONSTRAINT boolean_check CHECK (banned IN (0, 1))
);
