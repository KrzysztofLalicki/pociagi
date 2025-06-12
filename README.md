### Initializing the database
Run `/db/create.sql` in PostgreSQL to create the necessary objects:

`psql -U your_user -d your_db -f create.sql`

### Building and running application
Edit `/app/db.properties` and set the following:
```
db.url=jdbc:postgresql://localhost:5432/your_db
db.username=your_user
db.password=your_password
```
From the `/app` directory, run:

`./gradlew run`

### Clearing the database
To reset the database, run: `/db/clear.sql` in PostgreSQL:

`psql -U your_user -d your_db -f clear.sql`