# SQL
This is the folder containing all the sql needed to setup the tables in Supabase

Due to foreign keys, they must be done in this order
1. projects.sql
2. tags.sql
3. tasks.sql
4. task_tags.sql

You also need to ensure the Supabase auth is setup, as these tables rely on that to 
manage the account system
