cat ./sql_script.sql | docker exec -i postgres_container psql -U root -d postgres