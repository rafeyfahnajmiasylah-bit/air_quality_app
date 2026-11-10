class AirQuality {
  final double usAqi;
  final double pm2_5;
  final double pm10;
  final double carbonMonoxide;
  final double nitrogenDioxide;
  final double ozone;
  final double sulphurDioxide;
  final DateTime time;

  const AirQuality({
    required this.usAqi,
    required this.pm2_5,
    required this.pm10,
    required this.carbonMonoxide,
    required this.nitrogenDioxide,
    required this.ozone,
    required this.sulphurDioxide,
    required this.time,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;

    return AirQuality(
      usAqi: (current['us_aqi'] as num).toDouble(),
      pm2_5: (current['pm2_5'] as num).toDouble(),
      pm10: (current['pm10'] as num).toDouble(),
      carbonMonoxide:
          (current['carbon_monoxide'] as num).toDouble(),
      nitrogenDioxide:
          (current['nitrogen_dioxide'] as num).toDouble(),
      ozone: (current['ozone'] as num).toDouble(),
      sulphurDioxide:
          (current['sulphur_dioxide'] as num).toDouble(),
      time: DateTime.parse(current['time'] as String),
    );
  }
}
