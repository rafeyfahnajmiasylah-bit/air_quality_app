
# Panduan Pengerjaan dan Pengembangan — Air Quality Monitor

Dokumen ini berisi penjelasan proses pengembangan tugas Pemrograman Mobile berupa aplikasi pemantau kualitas udara menggunakan Flutter dan Open-Meteo API.

## A. Deskripsi Aplikasi

Air Quality Monitor merupakan aplikasi berbasis Flutter yang digunakan untuk menampilkan informasi kualitas udara di wilayah Makassar, Indonesia.

Aplikasi mengambil data kualitas udara melalui Open-Meteo Air Quality API berdasarkan koordinat geografis yang telah ditentukan. Informasi yang diperoleh kemudian ditampilkan dalam bentuk nilai Air Quality Index (AQI), detail polutan, dan rekomendasi kesehatan.

## B. Teknologi yang Digunakan

Teknologi dan tools yang digunakan dalam pengembangan aplikasi:

- Flutter: framework untuk membangun aplikasi.
- Dart: bahasa pemrograman yang digunakan Flutter.
- Visual Studio Code: code editor.
- Open-Meteo API: sumber data kualitas udara.
- HTTP: melakukan komunikasi antara aplikasi dan API.
- Git dan GitHub: version control dan penyimpanan source code.

## C. API dan Sumber Data

API yang digunakan adalah Open-Meteo Air Quality API.

Dokumentasi:
https://open-meteo.com/en/docs/air-quality-api

Pengambilan data menggunakan koordinat:

- Latitude: -5.1477
- Longitude: 119.4327
- Lokasi: Makassar, Indonesia

Data yang diambil dari API meliputi:

1. US Air Quality Index (US AQI)
2. PM2.5
3. PM10
4. Carbon Monoxide (CO)
5. Nitrogen Dioxide (NO2)
6. Ozone (O3)
7. Sulphur Dioxide (SO2)

Aplikasi menggunakan parameter current untuk memperoleh data kualitas udara terkini yang tersedia dari API.

## D. Struktur Folder Project

Struktur folder aplikasi dibuat dengan pemisahan tanggung jawab antara model, service, screen, dan widget.

```text
air_quality_app/
│
├── lib/
│   ├── models/
│   │   └── air_quality.dart
│   │
│   ├── services/
│   │   └── air_quality_service.dart
│   │
│   ├── ui/
│   │   ├── screens/
│   │   │   └── home_screen.dart
│   │   │
│   │   └── widgets/
│   │       ├── aqi_card.dart
│   │       ├── pollutant_card.dart
│   │       └── health_recommendation.dart
│   │
│   └── main.dart
│
├── test/
├── android/
├── ios/
├── pubspec.yaml
└── pubspec.lock
```

Penjelasan setiap folder:

### 1. Models

File `air_quality.dart` digunakan untuk mendefinisikan struktur data kualitas udara. Data JSON dari API dikonversi menjadi objek AirQuality menggunakan factory constructor fromJson.

### 2. Services

File `air_quality_service.dart` bertanggung jawab melakukan HTTP request ke Open-Meteo API, menerima response, memproses JSON, dan mengembalikan objek AirQuality.

### 3. UI - Screens

File `home_screen.dart` merupakan halaman utama aplikasi. Bagian ini mengatur pengambilan data, state aplikasi, loading, error, dan tampilan hasil.

### 4. UI - Widgets

Folder widgets berisi komponen tampilan yang dipisahkan berdasarkan fungsinya:

- `aqi_card.dart`: menampilkan nilai AQI dan kategori kualitas udara.
- `pollutant_card.dart`: menampilkan detail konsentrasi polutan.
- `health_recommendation.dart`: menampilkan rekomendasi kesehatan berdasarkan nilai AQI.

### 5. Main

File `main.dart` merupakan titik awal aplikasi dan mengatur konfigurasi MaterialApp serta tema aplikasi.

## E. Tahapan Pengembangan

Pengembangan aplikasi dilakukan melalui beberapa tahapan:

### Tahap 1 — Inisialisasi Project

Membuat project Flutter baru dengan nama air_quality_app dan menyiapkan struktur dasar aplikasi.

### Tahap 2 — Instalasi Dependencies

Menambahkan package yang diperlukan:

```bash
flutter pub add http
flutter pub add geolocator
flutter pub get
```

Package HTTP digunakan untuk mengambil data dari API. Geolocator ditambahkan sebagai dependency untuk kebutuhan fitur lokasi perangkat.

### Tahap 3 — Pembuatan Model Data

Membuat class AirQuality untuk menampung data kualitas udara yang diterima dari API.

Model menggunakan factory constructor fromJson untuk mengubah response JSON menjadi objek Dart.

### Tahap 4 — Integrasi API

Membuat AirQualityService untuk menghubungkan aplikasi dengan Open-Meteo API.

Proses meliputi pembuatan URL request, pengiriman HTTP GET, pemeriksaan status response, parsing JSON, dan penanganan kesalahan.

### Tahap 5 — Pengembangan UI

Membuat halaman utama dan komponen tampilan secara terpisah agar kode lebih terstruktur dan mudah dikelola.

### Tahap 6 — Integrasi Data

Menghubungkan service dengan halaman utama sehingga data dari API dapat ditampilkan pada komponen UI.

### Tahap 7 — Error Handling

Menambahkan kondisi loading, success, dan error untuk menangani berbagai kemungkinan selama pengambilan data.

Aplikasi juga menyediakan tombol retry agar pengguna dapat mencoba mengambil data kembali ketika terjadi kegagalan.

### Tahap 8 — Pengujian

Menjalankan aplikasi melalui Google Chrome dan memeriksa fungsi utama, tampilan, pengambilan data API, serta fitur refresh.

## F. Fitur Aplikasi

### 1. Air Quality Index

Menampilkan nilai US AQI dalam bentuk indikator visual beserta kategori kualitas udara.

### 2. Pollutant Details

Menampilkan informasi konsentrasi enam jenis polutan:

- PM2.5
- PM10
- Carbon Monoxide (CO)
- Nitrogen Dioxide (NO2)
- Ozone (O3)
- Sulphur Dioxide (SO2)

### 3. Health Recommendation

Memberikan rekomendasi kesehatan berdasarkan kategori nilai AQI.

### 4. Loading State

Menampilkan indikator ketika aplikasi sedang mengambil data dari API.

### 5. Error Handling

Menampilkan pesan kesalahan ketika aplikasi gagal mengambil atau memproses data.

### 6. Retry dan Refresh

Memungkinkan pengguna mengulangi proses pengambilan data melalui tombol yang tersedia pada aplikasi.

## G. Pengujian dan Validasi

Pengujian dilakukan dengan menjalankan aplikasi menggunakan perintah:

```bash
flutter run -d chrome
```

Pemeriksaan kode dilakukan menggunakan:

```bash
flutter analyze
```

Hasil pemeriksaan:

```text
No issues found!
```

Aplikasi berhasil dijalankan melalui Google Chrome dan berhasil menampilkan data kualitas udara dari Open-Meteo API.

Pengujian juga mencakup:

- Menampilkan nilai AQI.
- Menampilkan detail polutan.
- Menampilkan rekomendasi kesehatan.
- Menguji tombol refresh.
- Menguji kondisi error ketika koneksi internet terputus.
- Menguji tombol retry setelah koneksi kembali tersedia.

## H. Repository GitHub

Source code aplikasi disimpan pada repository GitHub berikut:

Repository Name: `air_quality_app`

Repository URL:

https://github.com/rafeyfahnajmiasylah-bit/air_quality_app

Proses upload dilakukan menggunakan Git melalui terminal:

```bash
git init
git add .
git commit -m "Initial commit - Air Quality Monitor"
git branch -M main
git remote add origin https://github.com/rafeyfahnajmiasylah-bit/air_quality_app.git
git push -u origin main
```

## I. Hasil Akhir

Aplikasi Air Quality Monitor berhasil dikembangkan menggunakan Flutter dengan memanfaatkan Open-Meteo Air Quality API sebagai sumber data.

Aplikasi mampu menampilkan nilai indeks kualitas udara, detail polutan, serta rekomendasi kesehatan berdasarkan data yang diperoleh dari API.

Source code telah disimpan pada repository GitHub dan pemeriksaan menggunakan Flutter Analyze berhasil dilakukan tanpa ditemukan masalah.

Repository:
https://github.com/rafeyfahnajmiasylah-bit/air_quality_app
