import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherRepository {
  final String apiKey = 'abc6b1d18f966167db5454e636871279';

  Future<List<Weather>> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List list = data['list'];

      return list.map((e) => Weather.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
