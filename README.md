<h1 align="center">
  <br>
  Database Lecturer Assistant Recruitment 2023
  <br>
  <br>
</h1>

<h2 align="center">
  Data Scraping, Database Modelling, Data Storing, & Data Visualization
  <br>
  <br>
</h2>

## Description
I did web scraping using Python programming to extract C&F sale fragrances data from cnfstore.com on July 3rd, 2023. The data has been through preprocessing with a total of 230 rows and 8 columns.
- id_product
- brand
- product_name
- size_ml
- type
- old_price_idr
- special_price_idr
- discount_percentage

For the data storing, I completed the fragrances data with some other tables and defined the relations one to another by utilizing ERD dan Relational Diagram principles. I load the data, apply the relations, and constraints using MySQL afterward. With a wide adoption and active community support, I can find resources and solutions easily. Moreover, MySQL's compatibility with various systems and programming languages, along with its support for relational databases, align perfectly with the ERD and Relational Diagram principles I applied for defining relationships and constraints between tables, making it a reliable, performant, and user-friendly choice for data storage and management.

## Specification
There are 3 folders in this repository and each folder contains 2-3 other folders to ensure readability.
1. `Data Scraping`
    - `data` contains JSON file that resulted from data scraping process.
    - `screenshot` contains the head and tail snippets of the data.
    - `src` contains codes to extract C&F sale fragrances data and perform data preprocessing.
3. `Data Storing`
    - `design` contains ERD dan Relational Diagram images.
    - `export` contains SQL file to load the database to MySQL on your computer.
    - `screenshot` contains a snippet of the loaded database.
5. `Data Visualization`
    - `src` contains codes to visualize C&F sale fragrances data insights and descriptive analysis for each visualization.
    - `visualization` contains all the data visualization images in PNG.

## How to Use
1. Clone this repository to your local storage.
2. Launch MySQL using CMD for Windows or  Terminal for Mac.
3. Create a new database called **cabasdat1** and then quit from MySQL.
4. Load the **cabasdat1.sql** with the following code.
   ```
   mysql -u root -p cabasdat1 < [cabasdat1.sql path]
   example : mysql -u root -p cabasdat1 < "TUGAS_SELEKSI_1_18221156\Data Storing\export\cabasdat1.sql"
   ```
6. Launch MySQL once more and use the database.
   ```
   use cabasdat1;
   ```

## JSON Structure
![JSON Structure](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Scraping/screenshot/data_head_tail.png)

## Database Structure
**Entity Relationship Diagram**
<br>
<br>
![ERD](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Storing/design/ERD.png)
<br>
<br>
<br>
**Relational Diagram**
<br>
<br>
![Relational Diagram](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Storing/design/RelationalDiagram.png)

## ERD to Relational Diagram Translation Process
1. Create a table(s) and add attributes for each **strong entity** in ERD and add a mark for the primary key.
2. Create a table(s) and add attributes for each **weak entity** and include the **referenced strong entity's primary key(s)** to the table.
3. If there is any **composite attribute**, flatten it out and create separate attributes for each component.
4. If there is any **multivalue attribute** ("Address" in customer entity), create a separate table and add a primary key(s) from its initial entity (customer). Set all attributes in that table as primary keys.
5. If there is any **derived attribute**, eliminate it from the table.
6. Check for **cardinality** (one-to-one, one-to-many, or many-to-many) of the relationship in ERD.
   - Many-to-Many : Create a new table and name it after the relationship. Add all the primary keys from related entities as the table's primary keys.
   - One-to-Many  : Add extra attribute(s) to the "many" side, containing the primary key(s) of the "one" side.
   - One-to-One   : Chose an entity to act as the "many" side and add an extra attribute(s), containing the primary key(s) of the "one" side.
7. Determine all the **foreign keys** by adding arrows, where the arrowhead is pointing to the referenced attribute.

## Other Screenshots
**Loaded Database**
<br>
<br>
![Loaded Database](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Storing/screenshot/cabasdat1_database.png)

## Reference
Library used :
1. BeautifulSoup
2. Requests
3. Re
4. Pandas
5. NumPy
6. Seaborn
7. Matplotlib.pyplot

##
<h2 align="center">
  Fredrick Runie Taslim | 18221156
  <br>
  <br>
</h2>
