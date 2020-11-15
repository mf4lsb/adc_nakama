# App Development Challenge  - Aplikasi Rumah Sakit
![SMKDEV](https://github.com/mf4lsb/adc_nakama/blob/main/Resorce_Repo/SMKDEV_Logo.png)

Aplikasi cek jadwal praktek dokter, booking jadwal konsul, informasi acara rumah sakit, feedback form, dan lain lain yang ditujukan untuk perlombaan Application Development Challange 1 2020 menggunakan Flutter.

## Feature yang tersedia

- Home
Pada halaman Home terdapat image slider atau carousel pada bagian paling atas,
dimana gambar-gambar yang muncul berupa event dan promo, yang ketika di klik salah
satu gambarnya akan membuka halaman detail dari event atau promo tersebut.
Dibawahnya terdapat bagian “Temui Kami” yang berisi Maps statis yang memunculkan
maps sesuai dengan alamat tempat tersebut, dan jam buka tempat tersebut.
Dibawahnya terdapat bagian “Tentang Kami” yang berisi gambar overview dari halaman
“Tentang Kami” yang dimana ketika di klik gambar tersebut atau “Selengkapnya” akan
berpindah ke halaman “Tentang Kami”, dan dibawah gambar overview terdapat daftar
beberapa dokter yang ada di rumah sakit tersebut, yang dimana ketika di klik salah satu
dokter nya akan berpindah ke halaman “Detail Dokter”.
Dibawahnya terdapat bagian “Berita Terbaru” yang berisi beberapa informasi terbaru
dari event dan promo maupun dari partner dan career.
Dibawahnya terdapat bagian “Kontak dan Pengaduan” yang berisi kontak yang dapat
dihubungi, yang dimana ketika di klik salah satunya akan membuka kontak tersebut,
contoh, ketika klik alamat email akan berpindah ke aplikasi kirim email dan sudah terisi
bagian email tujuan, atau ketika klik nomor handphone akan berpindah ke aplikasi
telepon dan sudah terisi bagian nomor tujuan

- Layanan
Pada halaman Layanan terdapat search bar yang berguna untuk mencari doktor,
fasilitas, layanan, event dan promo yang tersedia.
Di bagian bawahnya terdapat “Fasilitas dan Layanan Terkini” yang berisi daftar semua
fasilitas dan layanan yang tersedia.
Di bagian bawahnya terdapat “Event dan Promo” yang berisi daftar semua event dan
promo.
Yang dimana ketika salah satu dari item fasilitas dan layanan atau event dan promo
akan berpindah ke halaman detail tersebut.

- Booking
Pada halaman Booking terdapat daftar semua dokter yang ada, yang dimana ketika di
klik salah satunya akan berpindah ke halaman detail dokter.
Pada halaman detail dokter terdapat beberapa informasi tentang dokter, seperti foto,
jadwal praktek, biografi, kredensial, dan yang lainnya.
Ketika tombol “Buat Janji” yang ada pada halaman detail dokter di klik dan pengguna
belum login, maka akan menampilkan alert berbentuk pop up atau bottom sheet untuk
mengisi beberapa data yang diperlukan untuk mendaftarkan akun.
Setelah berhasil membuat akun atau jika sebelumnya sudah login, maka akan pindah ke
halaman konfirmasi atau detail booking, yang dimana pada halaman tersebut terdapat
detail pasien dan jam atau jadwal yang akan di booking.
Pengguna juga dapat mengganti atau memilih siapa pasien yang akan melakukan
konsultasi dokter, seperti contoh untuk anaknya, suaminya, atau yang lainnya.
Setelah pengguna mengkonfirmasi booking tersebut, pengguna dapat langsung kembali
ke halaman Home atau melihat histori booking milik nya.

- Profile
Pada halaman Profile jika pengguna belum melakukan login maka akan muncul alert
berbentuk pop up atau bottom sheet untuk mendaftarkan akun terlebih dahulu, seperti
yang terjadi pada halaman detail dokter ketika klik tombol "Buat Janji".
Jika pengguna sudah terdaftar atau login, akan muncul profil pengguna dan tab untuk
notifikasi dan histori booking. Dimana pada tab notifikasi akan berisi notifikasi yang
pengguna terima seperti adanya promo, event, waktunya kontrol, dan yang lainnya. Dan
pada tab histori booking berisi daftar riwayat booking pengguna baik yang sudah lewat
maupun akan berlangsung.
Dan ketika pengguna klik pada salah satu informasi seperti promo, event, atau yang
lainnya, maka akan pindah ke halaman detail dari notifikasi tersebut.

- Tentang Kami
Pada halaman ini terdapat informasi yang berhubungan dengan rumah sakit SMKDEV
ini, seperti informasi Alamat rumah sakit, informasi nomor layanan darurat dan waktu
operasional rumah sakit bekerja.

- Partner & Career
Pada halaman “Partner & Career” fungsi dan alur sama seperti "Halaman Layanan",
hanya saja halaman ini berisi daftar partner rumah sakit dan info lowongan yang sedang
tersedia pada rumah sakit.

- Feedback
Pada halaman ini peserta hanya menampilkan webview yang nantinya akan
menampilkan form feedback (Google Form).

## Dokumentasi Project

### Project Task Management
![Trello](https://d2k1ftgv7pobq7.cloudfront.net/meta/u/res/images/brand-assets/Logos/0099ec3754bf473d2bbf317204ab6fea/trello-logo-blue.png)
pada project ini kami menggunakan aplikasi Trello sebagai tools untuk pengaturan management projek sekaligus. berikut ini [linknya](https://trello.com/b/rrRJe04t/project-lomba-smkdev)

### User Acceptance Testing (UAT)
berikut ini list UAT pada aplikasi, ini [linknya](https://docs.google.com/spreadsheets/d/1PPtZQBDLdCzwltffMqKrRbiUDuuT-dASDAy3XG02Wv8/edit?usp=sharing)

### User Flow
berikut ini alur flow pada aplikasi kita aplikasi, ini [linknya](https://drive.google.com/file/d/1BWpv1d-IRTP7CuMkh8JGWZacmLZpG-0D/view?usp=sharing)

## Cara menjalankannya
- Pastikan Flutter sudah diinstall, bila belum silahkan ikuti petunjuk [flutter](https://flutter.dev/docs/get-started/install)
- Pastikan anda sudah menginstall git, bila belum silahkan ikuti petunjuk [git](https://git-scm.com/download/win)
- clone projek ini
```sh
$ git clone https://github.com/mf4lsb/adc_nakama.git
```
- bila anda menggunakan Android Studio, silahkan ikuti petujuk [ini](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio)
- bila anda menggunakan Visual Studio Code, silahkan ikuti petunjuk [ini](https://flutter.dev/docs/get-started/test-drive?tab=vscode)
- bila menggunakan terminal ikuti langkah berikut
```sh
$ cd adc_nakama
$ flutter devices
$ flutter run
```

