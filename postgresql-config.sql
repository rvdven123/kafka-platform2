#pg_back.conf changes
local   replication     <youruser>                          trust
host    replication     <youruser>  127.0.0.1/32            trust

#replication user must have
Replication privileges in the database to add the table to a publication.
CREATE privileges on the database to add publications.
SELECT privileges on the tables to copy the initial table data. Table owners automatically have SELECT permission for the table.

CREATE ROLE <replication_group>;

#Add the original owner of the table to the group.
GRANT REPLICATION_GROUP TO <original_owner>;

#Add the Debezium replication user to the group.
GRANT REPLICATION_GROUP TO <replication_user>;

#Transfer ownership of the table to <replication_group>.
ALTER TABLE <table_name> OWNER TO REPLICATION_GROUP;