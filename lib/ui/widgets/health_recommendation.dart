
import 'package:flutter/material.dart';

class HealthRecommendation extends StatelessWidget {
  final double aqi;

  const HealthRecommendation({
    super.key,
    required this.aqi,
  });

  String get recommendation {
    if (aqi <= 50) {
      return 'Air quality is good. Enjoy your outdoor activities!';
    } else if (aqi <= 100) {
      return 'Air quality is acceptable. Sensitive individuals should monitor their health.';
    } else if (aqi <= 150) {
      return 'Sensitive groups should reduce prolonged outdoor activities.';
    } else if (aqi <= 200) {
      return 'Limit outdoor activities and consider wearing a protective mask.';
    } else if (aqi <= 300) {
      return 'Avoid outdoor activities. Stay indoors whenever possible.';
    } else {
      return 'Health alert! Avoid outdoor exposure and keep windows closed.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3ED),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.health_and_safety,
                color: Color(0xFF27845D),
              ),
              SizedBox(width: 8),
              Text(
                'Health Recommendation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF183D32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            recommendation,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF365A4D),
            ),
          ),
        ],
      ),
    );
  }
}
