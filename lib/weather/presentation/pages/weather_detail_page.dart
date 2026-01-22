import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';

class WeatherDetailPage extends StatelessWidget {
  final Weather weather;

  const WeatherDetailPage({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '${weather.temp} °C',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    weather.description.toUpperCase(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(height: 32),
                _detailRow('Date', weather.date),
                _detailRow('Feels Like', '${weather.feelsLike} °C'),
                _detailRow('Humidity', '${weather.humidity}%'),
                _detailRow('Wind Speed', '${weather.windSpeed} m/s'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value),
        ],
      ),
    );
  }
}
