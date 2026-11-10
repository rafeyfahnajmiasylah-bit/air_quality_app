
import 'package:flutter/material.dart';

import '../../models/air_quality.dart';
import '../../services/air_quality_service.dart';
import '../widgets/aqi_card.dart';
import '../widgets/pollutant_card.dart';
import '../widgets/health_recommendation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AirQualityService _service = AirQualityService();

  AirQuality? _airQuality;
  bool _isLoading = true;
  String? _errorMessage;

  // Koordinat awal Makassar
  static const double _latitude = -5.1477;
  static const double _longitude = 119.4327;

  @override
  void initState() {
    super.initState();
    _loadAirQuality();
  }

  Future<void> _loadAirQuality() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final result = await _service.getAirQuality(
        latitude: _latitude,
        longitude: _longitude,
      );

      if (!mounted) return;

      setState(() {
        _airQuality = result;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage =
            'Gagal memuat data kualitas udara. '
            'Periksa koneksi internet dan coba lagi.';
        _isLoading = false;
      });
    }
  }

  String _getAqiStatus(double aqi) {
    if (aqi <= 50) return 'Good';
    if (aqi <= 100) return 'Moderate';
    if (aqi <= 150) return 'Unhealthy for Sensitive Groups';
    if (aqi <= 200) return 'Unhealthy';
    if (aqi <= 300) return 'Very Unhealthy';
    return 'Hazardous';
  }

  Color _getAqiColor(double aqi) {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow.shade800;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F7F5),
        elevation: 0,
        title: const Text(
          'Air Quality Monitor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF183D32),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _isLoading ? null : _loadAirQuality,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh data',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Memuat data kualitas udara...'),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off,
                size: 64,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              const Text(
                'Oops! Terjadi Kesalahan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _loadAirQuality,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    final data = _airQuality!;

    final status = _getAqiStatus(data.usAqi);
    final color = _getAqiColor(data.usAqi);

    return RefreshIndicator(
      onRefresh: _loadAirQuality,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Your Location',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFF27845D),
              ),
              SizedBox(width: 6),
              Text(
                'Makassar, Indonesia',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          AqiCard(
            aqi: data.usAqi,
            status: status,
            color: color,
          ),

          const SizedBox(height: 24),

          const Text(
            'Pollutant Details',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF183D32),
            ),
          ),
          const SizedBox(height: 12),

          PollutantCard(
            title: 'PM2.5',
            value: data.pm2_5,
            unit: 'µg/m³',
          ),
          PollutantCard(
            title: 'PM10',
            value: data.pm10,
            unit: 'µg/m³',
          ),
          PollutantCard(
            title: 'Carbon Monoxide (CO)',
            value: data.carbonMonoxide,
            unit: 'µg/m³',
          ),
          PollutantCard(
            title: 'Nitrogen Dioxide (NO₂)',
            value: data.nitrogenDioxide,
            unit: 'µg/m³',
          ),
          PollutantCard(
            title: 'Ozone (O₃)',
            value: data.ozone,
            unit: 'µg/m³',
          ),
          PollutantCard(
            title: 'Sulphur Dioxide (SO₂)',
            value: data.sulphurDioxide,
            unit: 'µg/m³',
          ),

          const SizedBox(height: 16),

          HealthRecommendation(aqi: data.usAqi),

          const SizedBox(height: 20),

          Text(
            'Last updated: ${data.time.toLocal()}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Data provided by Open-Meteo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
