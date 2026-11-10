
# Air Quality Monitor 🌿

Aplikasi pemantau kualitas udara berbasis Flutter yang menampilkan informasi kualitas udara berdasarkan data dari Open-Meteo Air Quality API.

Aplikasi ini dibuat sebagai tugas Pemrograman Mobile dengan tujuan menampilkan indeks kualitas udara (AQI), detail polutan, serta rekomendasi kesehatan berdasarkan kondisi kualitas udara.

## Features

- **Air Quality Index (AQI):** Menampilkan nilai US AQI dan kategori kualitas udara.
- **Pollutant Details:** Menampilkan konsentrasi PM2.5, PM10, Carbon Monoxide, Nitrogen Dioxide, Ozone, dan Sulphur Dioxide.
- **Health Recommendation:** Memberikan rekomendasi kesehatan berdasarkan nilai AQI.
- **Loading State:** Menampilkan indikator selama proses pengambilan data.
- **Error Handling:** Menampilkan pesan ketika terjadi kegagalan mengambil data.
- **Retry & Refresh:** Memungkinkan pengguna mencoba kembali dan memperbarui data kualitas udara.

## Technologies

- Flutter
- Dart
- HTTP Package
- Open-Meteo Air Quality API
- Material Design 3

## API Source

Data kualitas udara diperoleh dari:

[Open-Meteo Air Quality API](https://open-meteo.com/en/docs/air-quality-api)

Lokasi pengujian:
- City: Makassar, Indonesia
- Latitude: -5.1477
- Longitude: 119.4327

Data yang digunakan:
- US AQI
- PM2.5
- PM10
- Carbon Monoxide (CO)
- Nitrogen Dioxide (NO2)
- Ozone (O3)
- Sulphur Dioxide (SO2)

## Project Structure

```text
air_quality_app/
├── android/
├── docs/
│   └── DEVELOPMENT_PLAN.md
├── ios/
├── lib/
│   ├── models/
│   │   └── air_quality.dart
│   ├── services/
│   │   └── air_quality_service.dart
│   ├── ui/
│   │   ├── screens/
│   │   │   └── home_screen.dart
│   │   └── widgets/
│   │       ├── aqi_card.dart
│   │       ├── health_recommendation.dart
│   │       └── pollutant_card.dart
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── README.md
├── analysis_options.yaml
├── pubspec.lock
└── pubspec.yaml
```

## Installation and Setup

Clone repository:

```bash
git clone https://github.com/rafeyfahnajmiasylah-bit/air_quality_app.git
```

Masuk ke direktori project:

```bash
cd air_quality_app
```

Install dependencies:

```bash
flutter pub get
```

Jalankan aplikasi melalui Chrome:

```bash
flutter run -d chrome
```

## Code Analysis

Untuk memeriksa kode, jalankan:

```bash
flutter analyze
```

Hasil pemeriksaan:

```text
No issues found!
```

## Documentation

Dokumentasi proses pengembangan aplikasi dapat dilihat pada:

`docs/DEVELOPMENT_PLAN.md`

## Author

Developed as a Mobile Programming assignment.

## License

This project was developed for educational purposes.
