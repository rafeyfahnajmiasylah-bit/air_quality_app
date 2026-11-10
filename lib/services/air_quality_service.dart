
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/air_quality.dart';

class AirQualityService {
  static const String _baseUrl =
      'air-quality-api.open-meteo.com';

  Future<AirQuality> getAirQuality({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.https(
      _baseUrl,
      '/v1/air-quality',
      {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'current': [
          'us_aqi',
          'pm2_5',
          'pm10',
          'carbon_monoxide',
          'nitrogen_dioxide',
          'ozone',
          'sulphur_dioxide',
        ].join(','),
        'timezone': 'auto',
      },
    );

    try {
      final response = await http
          .get(uri)
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(response.body) as Map<String, dynamic>;

        return AirQuality.fromJson(json);
      }

      throw Exception(
        'Gagal mengambil data kualitas udara. '
        'Kode HTTP: ${response.statusCode}',
      );
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }

      throw Exception(
        'Terjadi kesalahan saat memproses data kualitas udara: $e',
      );
    }
  }
}
