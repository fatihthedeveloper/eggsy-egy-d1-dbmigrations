# Variables
DB_NAME = eggsy-db

# Commands
.PHONY: list create apply

# List all migrations and their status
list:
	npx wrangler d1 migrations list $(DB_NAME) --remote

# Create a new migration file (Usage: make create name=add_fields)
create:
	npx wrangler d1 migrations create $(DB_NAME) $(name)

# Apply migrations to the LIVE production database
apply:
	npx wrangler d1 migrations apply $(DB_NAME) --remote