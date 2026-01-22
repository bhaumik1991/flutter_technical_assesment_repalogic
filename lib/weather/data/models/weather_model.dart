class Weather {
  final String date;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String description;

  Weather({
    required this.date,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: json['dt_txt'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}
