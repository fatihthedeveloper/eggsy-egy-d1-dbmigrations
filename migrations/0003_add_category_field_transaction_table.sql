-- Migration number: 0003 	 2026-05-10T11:53:29.168Z
ALTER TABLE transactions 
ADD COLUMN category TEXT;