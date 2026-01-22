import 'package:flutter/material.dart';
import 'package:flutter_technical_assesment_repalogic/weather/data/models/weather_model.dart';
import 'package:flutter_technical_assesment_repalogic/weather/presentation/pages/weather_detail_page.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;

  const WeatherTile({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text('${weather.temp} °C'),
        subtitle: Text(weather.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => WeatherDetailPage(weather: weather),
            ),
          );
        },
      ),
    );
  }
}
