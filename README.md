<h1 align="center">
  <br>
  Seleksi Warga Basdat 2023
  <br>
  <br>
</h1>

<h2 align="center">
  <br>
  Data Scraping, Database Modelling & Data Storing
  <br>
  <br>
</h2>


## Description

## Specification

## How to Use

## JSON Structure
![JSON Structure](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Scraping/data/C%26F_sale_fragrances_cleaned.json)

## Database Structure
**Entity Relationship Diagram**
<br>
<br>
![ERD](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Scraping/data/C%26F_sale_fragrances_cleaned.json)
<br>
<br>
<br>
**Relational Diagram**
<br>
<br>
![Relational Diagram](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Scraping/data/C%26F_sale_fragrances_cleaned.json)

## ERD to Relational Diagram Translation Process
1. Create a table(s) and add attributes for each **strong entity** in ERD and add a mark for the primary key.
2. Create table(s) and add attributes for each **weak entity** and include the** referenced strong entity's primary key(s)** to the table.
3. If there is any composite attribute, flatten it out and create separate attributes for each component.
4. If there is any multivalue attribute ("Address" in customer entity), create a separate table and add a primary key(s) from its initial entity (customer). Set all attributes in that table as primary keys.
5. If there is any derived attribute, eliminate it from the table.
6. Check for cardinality (one-to-one, one-to-many, or many-to-many) of the relationship in ERD.
    - Many-to-Many : Create a new table and name it after the relationship. Add all the primary keys from related entities as the table's primary keys.
    - One-to-Many  : Add extra attribute(s) to the "many" side, containing the primary key(s) of the "one" side.
    - One-to-One   : Chose an entity to act as the "many" side and add an extra attribute(s), containing the primary key(s) of the "one" side.
7. Determine all the foreign keys by adding arrows, where the arrowhead is pointing to the referenced attribute.

## Screenshot
**Loaded Database**
<br>
<br>
![Loaded Database](https://github.com/fredrick03/TUGAS_SELEKSI_1_18221156/blob/main/Data%20Scraping/data/C%26F_sale_fragrances_cleaned.json)

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

### Data Scraping

1. Lakukan _data scraping_ dari sebuah laman web untuk memperoleh data atau informasi tertentu __TANPA MENGGUNAKAN API__. Hasil _data scraping_ ini nantinya akan disimpan dalam RDBMS.

2. Daftarkan judul topik yang akan dijadikan bahan _data scraping_ dan DBMS yang akan digunakan pada spreadsheet berikut: [Topik Data Scraping](https://docs.google.com/spreadsheets/d/1D49SykkryzOAI1Fk9YI_-YpEV2lBw-p0_ZiRieGe0xQ/edit?usp=sharing). Usahakan agar tidak ada peserta dengan topik yang sama. Akses edit ke spreadsheet akan ditutup tanggal __1 Juli 2023 pukul 21.40 WIB.__

3. Pada folder `Data Scraping`, calon warga basdat harus mengumpulkan _file script_, json hasil _data scraping_. Folder `Data Scraping` terdiri dari _folder_ `src`, `data` dan `screenshots`. 
    - _Folder_ `src` berisi _file script_/kode yang __*WELL DOCUMENTED* dan *CLEAN CODE*__.
    - _Folder_ `data` berisi _file_ json hasil _scraper_.
    - _Folder_ `screenshot` berisi tangkapan layar program.

4. Sebagai referensi untuk mengenal _data scraping_, asisten menyediakan dokumen "_Short Guidance To Data Scraping_" yang dapat diakses pada link berikut: [Data Scraping Guidance](https://docs.google.com/document/d/1vEyAK1HIkM792oIuwR4Li2xOodmAcCXxentCCivxxkw/edit?usp=sharing). Peserta diharapkan untuk memperhatikan etika dalam melakukan _scraping_.

5. Data yang diperoleh harus di-_preprocessing_ terlebih dahulu.
```
Preprocessing contohnya :
- Cleaning
- Parsing
- Transformation
- dan lainnya
```

### Database Modelling & Data Storing

1. Dari data _scraping_ yang sudah dilakukan, lakukan __pengembangan *database*__ dalam bentuk ERD kemudian __translasi ERD tersebut menjadi diagram relasional.__ Tambahkan tabel lain yang sekiranya berkaitan dengan tabel-tabel yang didapatkan dari _data scraping_ yang dilakukan.
   
2. Implementasikan skema relational diagram tersebut ke __RDBMS__ sesuai pilihan peserta. __DBMS No-SQL tidak akan diterima.__ Jangan lupa implementasikan _constraints (primary key, foreign key,_ dsb) pada _database_ yang dibuat.

3. Masukkan data hasil _scraping_ ke dalam RDBMS yang sudah dibuat. Tambahan tabel pada skema yang dibuat tidak perlu diisi dengan data _dummy_ (cukup dibiarkan kosong).

4. Tools yang digunakan __dibebaskan__ pada peserta.

5. Pada folder `Data Storing`, Calon warga basdat harus mengumpulkan bukti penyimpanan data pada DBMS. _Folder_ `Data Storing` terdiri dari folder `screenshots`, `export`, dan `design`.
    - _Folder_ `screenshot` berisi tangkapan layar bukti dari penyimpanan data ke RDBMS.
    - _Folder_ `export` berisi _file_ hasil _export_ dari DBMS dengan format `.sql`.
    -  _Folder_ `design` berisi ER Diagram dan diagram relasional yang disimpan dalam format `.png`


### Bonus
Task berikut bersifat tidak wajib (__BONUS__), boleh dikerjakan sebagian atau seluruhnya.

- Buatlah visualisasi data dalam bentuk _dashboard_ (dari data hasil _scraping_ saja) dan jelaskan apa _insights_ yang didapatkan dari visualisasi data tersebut. _Tools_ untuk melakukan visualisasi data ini dibebaskan pada peserta.

### Pengumpulan


1. Dalam mengerjakan tugas, calon warga basdat terlebih dahulu melakukan _fork_ project github pada link berikut: [Seleksi-2023-Tugas-1](https://github.com/wargabasdat/Seleksi-2023-Tugas-1). Sebelum batas waktu pengumpulan berakhir, calon warga basdat harus sudah melakukan _pull request_ dengan nama ```TUGAS_SELEKSI_1_[NIM]```

2. Tambahkan juga `.gitignore` pada _file_ atau _folder_ yang tidak perlu di-_upload_. __NB: BINARY TIDAK DIUPLOAD__

3. Berikan satu buah file `README` yang __WELL DOCUMENTED__ dengan cara __override__ _file_ `README.md` ini. `README` harus minimal memuat konten :


```
- Description of the data and DBMS (Why you choose it)
- Specification of the program
- How to use
- JSON Structure
- Database Structure (ERD and relational diagram)
- Explanation of ERD to relational diagram translation process
- Screenshot program (di-upload pada folder screenshots, di-upload file image nya, dan ditampilkan di dalam README)
- Reference (Library used, etc)
- Author
```


4. Deadline pengumpulan tugas 1 adalah <span style="color:red">__17 Juli 2023 Pukul 22.40 WIB__</span>

<h3 align="center">
  <br>
  Selamat Mengerjakan!
  <br>
</h3>

<p align="center">
  <i>
  Happiness does not come from doing easy work
  but from the afterglow of satisfaction that
  comes after the achievement of a difficult
  task that demanded our best.<br><br>
  - Theodore Isaac Rubin
  </i>
</p>
<br>
