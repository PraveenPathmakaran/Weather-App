import '../api/api_key.dart';

String apiUrl(lat, lon) {
  String url;
  url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=&appid=$apiKey&units=metric&exclude=minutely';
  return url;
}
