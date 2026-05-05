```text
# 1. Classroom App Flutter
Classroom App Flutter adalah aplikasi mobile berbasis Flutter yang digunakan untuk menampilkan daftar jadwal kelas teori dan praktikum dalam satu halaman. Aplikasi ini dibuat dengan tampilan modern, rapi, responsif, dan mudah digunakan.
Aplikasi menampilkan data jadwal dalam bentuk card/list yang dapat discroll. Setiap jadwal memiliki informasi lengkap seperti nama mata kuliah, jenis kelas, kelas, hari, jam, ruangan, dosen atau asisten, icon, dan warna tampilan yang berbeda.
Aplikasi ini juga memiliki fitur filter untuk menampilkan semua kelas, kelas teori, atau kelas praktikum.

# 2. Deskripsi Aplikasi
Aplikasi ini berfungsi sebagai tampilan daftar jadwal kelas. Data jadwal disimpan secara lokal di dalam project Flutter, kemudian ditampilkan ke halaman utama menggunakan komponen UI yang dipisahkan ke dalam beberapa file widget.
Tampilan aplikasi menggunakan desain berbasis card dengan warna gradient pastel. Setiap card memiliki icon yang mewakili mata kuliah, badge jenis kelas, nama kelas, jadwal, lokasi ruangan, dan nama pengajar.
Aplikasi menggunakan CustomScrollView dan SliverList agar daftar jadwal dapat discroll dengan lebih fleksibel. Header aplikasi menggunakan SliverAppBar yang dapat berubah tampilan ketika halaman discroll.

# 3. Fitur Aplikasi
Aplikasi ini memiliki beberapa fitur utama, yaitu:
1. Menampilkan daftar jadwal kelas.
2. Menampilkan kelas teori dan praktikum.
3. Filter jadwal berdasarkan kategori Semua, Teori, dan Praktikum.
4. Header interaktif menggunakan SliverAppBar.
5. Efek parallax pada header.
6. Tampilan card modern menggunakan gradient.
7. Tampilan responsif menggunakan Row, Column, Expanded, Spacer, dan Wrap.
8. Informasi setiap kelas ditampilkan dengan icon, judul, dan deskripsi.
9. Data jadwal ditampilkan secara dinamis menggunakan SliverChildBuilderDelegate.
10. Struktur kode dibuat modular agar mudah dibaca dan dikembangkan.

# 4. Teknologi yang Digunakan
Aplikasi ini dibuat menggunakan:
1. Flutter
2. Dart
3. Material Design 3
Flutter digunakan untuk membangun tampilan aplikasi mobile. Dart digunakan sebagai bahasa pemrograman utama. Material Design 3 digunakan melalui konfigurasi ThemeData dengan useMaterial3 bernilai true.

# 5. Struktur Project
lib/
|
├── constants/
│   └── app_colors.dart
|
├── data/
│   └── class_schedule_data.dart
|
├── models/
│   └── class_schedule.dart
|
├── pages/
│   └── class_schedule_page.dart
|
├── widgets/
│   ├── class_schedule_card.dart
│   ├── filter_section.dart
│   ├── schedule_parallax_header.dart
│   └── section_title.dart
|
├── app.dart
└── main.dart

---

# 6. Penjelasan Alur Aplikasi
Aplikasi dimulai dari file main.dart. Pada file ini terdapat fungsi main() yang menjalankan aplikasi menggunakan runApp().

Widget utama yang dijalankan adalah MyClassroomApp. Widget ini berada di file app.dart dan berfungsi sebagai konfigurasi awal aplikasi.

Di dalam MyClassroomApp terdapat MaterialApp yang mengatur judul aplikasi, tema warna, background, Material Design 3, dan halaman pertama yang ditampilkan.

Halaman utama aplikasi adalah ClassSchedulePage. Halaman ini menampilkan header, filter, judul section, dan daftar jadwal kelas.

# 7. Penjelasan File main.dart
File main.dart merupakan titik awal aplikasi Flutter.
Pada file ini terdapat kode:

void main() {
  runApp(const MyClassroomApp());
}

Fungsi main() akan dipanggil pertama kali saat aplikasi dijalankan. Fungsi runApp() digunakan untuk menjalankan widget utama aplikasi, yaitu MyClassroomApp.

# 8. Penjelasan File app.dart
File app.dart berisi class MyClassroomApp yang merupakan StatelessWidget.
Di dalam class ini terdapat MaterialApp yang mengatur konfigurasi utama aplikasi, seperti:
1. title untuk nama aplikasi.
2. debugShowCheckedModeBanner false agar label debug tidak muncul.
3. theme untuk mengatur tema aplikasi.
4. scaffoldBackgroundColor untuk warna background utama.
5. colorScheme untuk skema warna aplikasi.
6. useMaterial3 agar aplikasi menggunakan Material Design 3.
7. home untuk menentukan halaman utama aplikasi.
Halaman utama yang digunakan adalah ClassSchedulePage.

# 9. Penjelasan File app_colors.dart
File app_colors.dart berfungsi untuk menyimpan warna-warna utama yang digunakan dalam aplikasi.
Warna yang didefinisikan antara lain:
1. background untuk warna latar aplikasi.
2. headerBlue untuk warna utama header.
3. headerBlue2 untuk warna gradient kedua header.
4. textDark untuk warna teks utama.
5. textMuted untuk warna teks tambahan.
File ini juga memiliki extension ColorOpacity. Extension ini menambahkan method withAlphaValue() pada Color agar opacity dapat diubah menjadi nilai alpha.
Penggunaan file constants seperti ini membuat warna aplikasi lebih terpusat, sehingga jika ingin mengganti warna cukup dilakukan dari satu file.

# 10. Penjelasan Model ClassSchedule
Model ClassSchedule digunakan sebagai struktur data untuk menyimpan informasi jadwal kelas.
Setiap data jadwal memiliki beberapa atribut:
1. title untuk nama mata kuliah.
2. type untuk jenis kelas, yaitu Teori atau Praktikum.
3. className untuk nama kelas.
4. day untuk hari pelaksanaan.
5. time untuk jam pelaksanaan.
6. room untuk ruangan.
7. lecturer untuk dosen atau asisten.
8. icon untuk icon mata kuliah.
9. colors untuk warna gradient card.
Model ini membuat data jadwal lebih rapi karena setiap item memiliki struktur yang sama.

# 11. Penjelasan Data Jadwal
Data jadwal disimpan dalam bentuk const List<ClassSchedule> bernama classSchedules.
Setiap item di dalam list adalah object ClassSchedule. Data yang disimpan mencakup jadwal teori dan praktikum.
Contoh data yang ditampilkan dalam aplikasi antara lain:
1. Desain dan Pengembangan Sistem Informasi.
2. Teknologi Mobile.
3. Jaringan Komputer.
4. Arsitektur Enterprise.
5. Riset dan Desain Pengalaman Pengguna.
6. Bahasa Indonesia.
7. Keamanan Informasi.

Data praktikum juga ditampilkan dengan ruangan laboratorium dan pengajar berupa Asisten Praktikum.

# 12. Penjelasan Halaman ClassSchedulePage
ClassSchedulePage adalah halaman utama aplikasi. Halaman ini menggunakan StatefulWidget karena memiliki data yang dapat berubah, yaitu filter yang dipilih pengguna.
Variabel selectedFilter digunakan untuk menyimpan filter aktif. Nilai awalnya adalah Semua.

Daftar filter yang tersedia adalah:
1. Semua
2. Teori
3. Praktikum

Aplikasi memiliki getter filteredSchedules untuk menentukan data jadwal yang ditampilkan. Jika filter yang dipilih adalah Semua, maka seluruh data ditampilkan. Jika filter yang dipilih adalah Teori atau Praktikum, maka data akan difilter berdasarkan type.
Method _changeFilter() menggunakan setState() untuk mengubah filter aktif dan memperbarui tampilan.

# 13. Implementasi CustomScrollView dan Sliver
Halaman utama menggunakan CustomScrollView sebagai layout scroll utama.
Di dalam CustomScrollView terdapat beberapa sliver:
1. SliverAppBar untuk header.
2. SliverToBoxAdapter untuk menampilkan filter dan judul section.
3. SliverPadding untuk memberi padding pada list.
4. SliverList untuk menampilkan daftar jadwal kelas.
Penggunaan SliverList membuat aplikasi lebih efisien karena item list dibuat berdasarkan kebutuhan menggunakan builder.

# 14. Penjelasan SliverAppBar
SliverAppBar digunakan sebagai header aplikasi yang dapat merespons scroll.
Properti yang digunakan antara lain:

1. pinned: true, agar header tetap terlihat saat discroll.
2. stretch: true, agar header dapat memberikan efek saat ditarik.
3. expandedHeight untuk tinggi header saat terbuka.
4. toolbarHeight untuk tinggi header saat mengecil.
5. elevation: 0 agar header tidak memiliki bayangan default.
6. backgroundColor untuk warna header.
7. shape untuk membuat sudut bawah header melengkung.
8. flexibleSpace untuk menampilkan widget ScheduleParallaxHeader.

Header dibuat lebih menarik dengan gradient, icon kalender, dekorasi lingkaran, dan perubahan tampilan dari header besar ke header compact.

---

# 15. Penjelasan ScheduleParallaxHeader

ScheduleParallaxHeader adalah widget untuk membuat header interaktif dengan efek parallax.

Widget ini menggunakan LayoutBuilder untuk mengetahui tinggi header saat berubah ketika halaman discroll.

Nilai progress dihitung berdasarkan perubahan tinggi header. Nilai ini digunakan untuk mengatur:

1. Posisi dekorasi header.
2. Opacity header besar.
3. Opacity header compact.
4. Kondisi kapan header besar dan compact ditampilkan.

Saat header masih terbuka, aplikasi menampilkan header besar yang berisi sapaan, judul, deskripsi, dan icon. Saat halaman discroll, header berubah menjadi tampilan compact yang berisi judul dan jumlah kelas.

---

# 16. Penjelasan FilterSection

FilterSection adalah widget untuk menampilkan tombol filter kategori kelas.

Widget ini menerima tiga parameter:

1. filters, yaitu daftar filter.
2. selectedFilter, yaitu filter yang sedang aktif.
3. onSelected, yaitu function yang dipanggil saat filter dipilih.

FilterSection menggunakan Row agar tombol filter tersusun horizontal. Setiap tombol dibungkus dengan Expanded agar ukurannya seimbang.

GestureDetector digunakan agar setiap tombol dapat ditekan. Saat tombol ditekan, onSelected akan menjalankan perubahan filter di halaman utama.

Tombol filter aktif memiliki warna berbeda, border, dan shadow. Tombol yang tidak aktif menggunakan warna putih dan teks abu-abu.

---

# 17. Penjelasan SectionTitle

SectionTitle adalah widget untuk menampilkan judul daftar kelas dan jumlah kelas yang sedang tampil.

Widget ini menggunakan Row untuk menyusun teks Daftar Kelas di sisi kiri dan badge jumlah kelas di sisi kanan.

Spacer digunakan di antara teks dan badge agar keduanya terdorong ke sisi yang berbeda.

Badge jumlah kelas dibuat menggunakan Container dengan padding, background warna biru transparan, dan border radius agar tampil seperti label kecil.

---

# 18. Penjelasan ClassScheduleCard

ClassScheduleCard adalah widget utama untuk menampilkan satu data jadwal kelas.

Widget ini menerima object ClassSchedule melalui parameter schedule.

Card menampilkan informasi:

1. Icon mata kuliah.
2. Jenis kelas.
3. Nama kelas.
4. Nama mata kuliah.
5. Hari dan jam.
6. Ruangan.
7. Dosen atau asisten.

Card menggunakan Container dengan margin bawah agar setiap card memiliki jarak. BoxDecoration digunakan untuk memberi border radius dan shadow.

Bagian dalam card menggunakan ClipRRect agar sudut card tetap melengkung sesuai border radius. Background card menggunakan LinearGradient berdasarkan warna yang ada pada data schedule.

---

# 19. Penjelasan roomText

Di dalam ClassScheduleCard terdapat getter roomText.

Getter ini digunakan untuk mengatur format teks ruangan.

Jika ruangan mengandung kata lab, maka teks ruangan ditampilkan langsung. Contohnya Lab PSI atau Lab SBTI.

Jika ruangan bukan laboratorium, maka teks akan ditambahkan kata Ruang di depannya. Contohnya 4.1.5.63 menjadi Ruang 4.1.5.63.

---

# 20. Penjelasan Dekorasi Card

Card memiliki beberapa dekorasi visual menggunakan Stack dan Positioned.

Dekorasi yang digunakan antara lain:

1. Lingkaran transparan di beberapa posisi.
2. Icon besar transparan di bagian belakang card.
3. Gradient warna pada background.
4. Shadow mengikuti warna utama card.

Dekorasi ini membuat card terlihat lebih modern dan tidak monoton.

---

# 21. Penjelasan _ClassIcon

_ClassIcon digunakan untuk menampilkan icon mata kuliah di sisi kiri card.

Widget ini menggunakan Container dengan ukuran 58x58, background putih transparan, border, border radius, dan icon.

Icon yang ditampilkan berasal dari data schedule.icon.

---

# 22. Penjelasan _ClassInfo

_ClassInfo digunakan untuk menampilkan detail informasi kelas.

Widget ini menggunakan Column agar informasi tersusun secara vertikal.

Informasi yang ditampilkan terdiri dari:

1. Badge jenis kelas.
2. Nama kelas.
3. Judul mata kuliah.
4. Hari dan jam.
5. Ruangan.
6. Dosen atau asisten.

Bagian jenis kelas dan nama kelas menggunakan Wrap agar tetap rapi ketika ruang layar terbatas.

Judul mata kuliah dibatasi dengan maxLines 2 dan overflow ellipsis agar teks panjang tidak merusak layout.

---

# 23. Penjelasan _TypeBadge

_TypeBadge digunakan untuk menampilkan jenis kelas, yaitu Teori atau Praktikum.

Badge dibuat dengan Container yang memiliki padding, warna putih transparan, border, dan border radius. Teks dibuat bold agar mudah dibaca.

---

# 24. Penjelasan _InfoLine

_InfoLine digunakan untuk menampilkan baris informasi kecil pada card.

Setiap baris terdiri dari icon dan text. Widget ini menggunakan Row agar icon dan teks sejajar secara horizontal.

Expanded digunakan pada bagian text agar teks dapat menyesuaikan ruang yang tersedia. Jika teks terlalu panjang, maka akan dipotong menggunakan overflow ellipsis.

_InfoLine digunakan untuk informasi jadwal, lokasi, dan pengajar.

---

# 25. Penggunaan Row

Row digunakan untuk menyusun widget secara horizontal.

Dalam aplikasi ini, Row digunakan pada beberapa bagian:

1. Menyusun tombol filter.
2. Menyusun judul Daftar Kelas dan badge jumlah kelas.
3. Menyusun icon dan informasi pada card jadwal.
4. Menyusun isi header besar dan header compact.
5. Menyusun icon dan teks pada baris informasi.

Penggunaan Row membuat elemen-elemen yang seharusnya sejajar ke samping dapat ditampilkan dengan rapi.

---

# 26. Penggunaan Column

Column digunakan untuk menyusun widget secara vertikal.

Dalam aplikasi ini, Column digunakan untuk:

1. Menyusun filter, section title, dan jarak pada halaman utama.
2. Menyusun teks pada header.
3. Menyusun detail informasi kelas pada card.
4. Menyusun judul dan jumlah kelas pada header compact.

Column membuat informasi yang berurutan dapat ditampilkan dari atas ke bawah dengan struktur yang jelas.

---

# 27. Penggunaan Expanded

Expanded digunakan agar widget dapat mengisi ruang kosong yang tersedia.

Dalam aplikasi ini, Expanded digunakan untuk:

1. Membuat tombol filter memiliki lebar seimbang.
2. Membuat area informasi card menyesuaikan sisa ruang setelah icon.
3. Mencegah teks panjang bertabrakan dengan elemen lain.
4. Membuat teks pada _InfoLine dapat dipotong dengan ellipsis jika terlalu panjang.

Expanded sangat penting untuk membuat layout tetap responsif.

---

# 28. Penggunaan Spacer

Spacer digunakan untuk memberi jarak fleksibel antar widget.

Dalam aplikasi ini, Spacer digunakan pada SectionTitle untuk memisahkan teks Daftar Kelas dan badge jumlah kelas. Dengan Spacer, badge akan terdorong ke sisi kanan secara otomatis.

---

# 29. Penggunaan Wrap

Wrap digunakan pada bagian informasi jenis kelas dan nama kelas.

Wrap dipilih karena lebih fleksibel dibanding Row ketika ukuran layar sempit. Jika ruang horizontal tidak cukup, elemen dapat turun ke baris berikutnya tanpa merusak tampilan.

---

# 30. Penggunaan Padding dan Margin

Padding digunakan untuk memberi jarak di dalam widget. Contohnya padding pada card, filter, header, dan badge.

Margin digunakan untuk memberi jarak di luar widget. Contohnya margin bawah pada setiap card agar card tidak saling menempel.

Penggunaan padding dan margin membuat tampilan lebih lega dan mudah dibaca.

---

# 31. Penggunaan Border Radius

Border radius digunakan untuk membuat sudut widget menjadi melengkung.

Border radius diterapkan pada:

1. Header bagian bawah.
2. Card jadwal kelas.
3. Tombol filter.
4. Badge jumlah kelas.
5. Icon box.
6. Type badge.

Sudut melengkung membuat tampilan aplikasi terlihat lebih modern.

---

# 32. Penggunaan Gradient

Gradient digunakan untuk membuat perpaduan warna pada background.

Gradient diterapkan pada:

1. Header aplikasi.
2. Card jadwal kelas.

Setiap card memiliki warna gradient yang berbeda berdasarkan data schedule.colors. Hal ini membuat setiap mata kuliah memiliki tampilan visual yang unik.

---

# 33. Penggunaan Shadow

Shadow digunakan untuk memberikan efek bayangan pada card dan tombol filter aktif.

Pada card, shadow menggunakan warna utama dari gradient agar bayangan terlihat menyatu dengan desain card.

Pada tombol filter, shadow hanya muncul ketika filter sedang aktif. Hal ini membantu pengguna mengetahui filter mana yang sedang dipilih.

---

# 34. Implementasi List

Aplikasi menggunakan SliverList untuk menampilkan daftar jadwal kelas.

SliverList menggunakan SliverChildBuilderDelegate. Dengan builder ini, setiap item jadwal dibuat berdasarkan index dari data schedules.

Jumlah item yang ditampilkan ditentukan oleh childCount: schedules.length.

Pendekatan ini membuat list lebih efisien karena widget dibuat sesuai kebutuhan saat ditampilkan pada layar.

---

# 35. Implementasi Filter Data

Filter data dilakukan pada getter filteredSchedules.

Jika selectedFilter bernilai Semua, maka seluruh data classSchedules dikembalikan.

Jika selectedFilter bernilai Teori atau Praktikum, maka data difilter menggunakan where() berdasarkan schedule.type.

Setelah filter dipilih, setState() akan memperbarui selectedFilter dan tampilan aplikasi akan dirender ulang.

---

# 36. Responsivitas Tampilan

Aplikasi dibuat responsif dengan beberapa pendekatan:

1. Expanded digunakan agar elemen menyesuaikan ruang layar.
2. Wrap digunakan agar badge tetap rapi pada layar kecil.
3. maxLines dan overflow ellipsis digunakan untuk menangani teks panjang.
4. CustomScrollView digunakan agar seluruh halaman dapat discroll.
5. Padding dan margin membuat tampilan tetap nyaman pada berbagai ukuran layar.

Dengan pendekatan ini, tampilan aplikasi tidak mudah rusak ketika teks panjang atau ukuran layar berubah.

---

# 37. Cara Menjalankan Project

1. Clone repository.

git clone https://github.com/username/classroom-app-flutter.git

2. Masuk ke folder project.

cd classroom-app-flutter

3. Install dependency.

flutter pub get

4. Jalankan aplikasi.

flutter run

---

# 38. Hasil Aplikasi

Aplikasi berhasil menampilkan daftar jadwal kelas dalam bentuk list/card yang rapi dan modern.

Setiap item jadwal memiliki icon, judul mata kuliah, jenis kelas, deskripsi jadwal, ruangan, dan pengajar.

Filter kategori dapat digunakan untuk menampilkan semua jadwal, hanya teori, atau hanya praktikum.

Header aplikasi dapat berubah dari tampilan besar menjadi compact ketika halaman discroll.

---

# 39. Kesimpulan

Classroom App Flutter merupakan aplikasi jadwal kelas yang dibuat dengan struktur project modular dan tampilan yang responsif.

Aplikasi ini menerapkan konsep layout Flutter seperti Row, Column, Expanded, Spacer, Wrap, CustomScrollView, SliverAppBar, dan SliverList.

Aplikasi juga menerapkan styling seperti padding, margin, border radius, gradient, shadow, serta penggunaan icon dan badge untuk memperjelas informasi.

Dengan struktur kode yang dipisahkan ke dalam constants, models, data, pages, dan widgets, aplikasi menjadi lebih mudah dibaca, dirawat, dan dikembangkan.
```
