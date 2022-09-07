# PostgreSQL data filtering


This project aims to demonstrate an example of automated data sorting using the bash script that runs SQL queries in the PostgreSQL RDBMS.


## How to use
1. Clone the repository `git clone https://github.com/kravchenkoda/postgresql-data-filtering`
2. Install the PostgreSQL `sudo apt install postgresql postgresql-contrib`
3. Navigate to the project repository `cd postgresql-data-filtering`
4. Run the `deployment.sh` file with root privileges `sudo bash development.sh`

## The data set

The data set that has been used is the 558 US craft beer breweries with a total of 2410 different beers within 99 styles.

Some rows contain text in parentheses inside the `name` column of the `beer.beers` table, e.g.:


- Poleeko Gold Pale Ale (2009)
 
- Colorado Native (2011)
 
-  On the Count of 3 (2015)

That is exactly the kind of data this script is going to sort. 



## The overall deployment process


* The bash script asks the user to input the name of the database, role, user and a password for Postgres.
* Creates the `.env` file in the project root repository and puts `PGUSER` `PGROLE` `PGDATABASE` variables inside. As well as `PGHOST` and `PGPORT` with the default values of `localhost` and `5432` respectively. 
*(You may change host and port in the development.sh file.)*
* Logs into the postgres database as a root and uses `PGUSER`, `PGROLE`, `PGDATABASE` variables from `.env` file to create the user, database and role. Gives privilege to the role and grants the user to this role.
* Logs into the database with the new user and creates the `beer` schema
* Starts a loop executing `.sql` files from `./sql_scripts` by the version *(1_\*.sql, 2_\*.sql, 3_\*.sql)*. Creates tables, inserts data, creates functions for stateful trigger creation for each table, passes parameters and executes them.
* Filters the data and stores it in the `result.txt`` file demonstrating the number of corrupted rows and the number of clear rows sorted out by the script.

## `deployment.sh` additional details


* This script as well as SQL queries it uses are stateful, so it may be run multiple times with no exceptions.
* If the entered username already exists in Postgres, the script will display a message prompting the user to enter a valid existing password in order to avoid an authentication error.
* Once executed not for the first time and if the `.env` file for some reason does not contain at least one of the required variables, it will ask to enter username, role, database name and the password once again to re-write the `.env` file.
* In case the database, role or the user already exists, the script is going to skip it and will raise appropriate notice.

## SQL Scripts and the `beer` Schema visualisation


<img src="https://i.ibb.co/QKgs3Fj/postgresql-data-filtering-DDL-2.png" alt="drawing" width="700"/>


Once the loop starts to execute files from `./sql_scripts` it performs the following actions:
* Creates the `beer.trigger_set_timestamp()` function which alters the `updated_at` column in every table when a row is updated.
* Creates the `beer.trigger_creation()` function that checks whether the trigger for the `updated_at` column exists and creates it if necessary. 
* Creates tables due to standard data normalization practices *(states, cities, breweries, beers, beers_quarantine, beers_filtered)*, inserts data into it, takes parameters and executes `beer.trigger_creation()`.
* Filters the `beer.beers` using the `%(%)%` pattern specified in `8_beers_f_filter.sql` and `9_beers_q_filter`. Inserts `IDs` that match the pattern into `beer.beers_quarantine`, other `IDs` are inserted into `beer.beers_filtered`.



## Result

The script executes `11_result.sql` and performs a simple count of rows from `beer.beers_quarantine` and `beer.beers_filtered`. Connects them using subqueries and redirects output to `result.txt`. Prints the result on the screen. 