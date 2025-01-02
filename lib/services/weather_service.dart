import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';
import '../models/forecast_model.dart';

class WeatherService {
  final Dio _dio = Dio();
  late final String _apiKey;
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  WeatherService() {
    _apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
    if (_apiKey.isEmpty) {
      throw Exception(
          'API anahtarı bulunamadı. Lütfen .env dosyasını kontrol edin.');
    }
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/weather',
        queryParameters: {
          'q': city,
          'appid': _apiKey,
          'units': 'metric',
          'lang': 'tr',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Hava durumu verileri alınamadı');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': _apiKey,
          'units': 'metric',
          'lang': 'tr',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Hava durumu verileri alınamadı');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<List<ForecastModel>> getHourlyForecast(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': _apiKey,
          'units': 'metric',
          'lang': 'tr',
          'cnt': 8, // 24 saatlik veri (3 saatlik aralıklarla)
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['list'];
        return list.map((item) => ForecastModel.fromJson(item)).toList();
      } else {
        throw Exception('Hava durumu tahmin verileri alınamadı');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<List<ForecastModel>> getDailyForecast(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'appid': _apiKey,
          'units': 'metric',
          'lang': 'tr',
          'cnt': 40, // 5 günlük veri (3 saatlik aralıklarla)
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> list = response.data['list'];
        final Map<String, ForecastModel> dailyForecasts = {};

        for (var item in list) {
          final DateTime date =
              DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
          final String dayKey = '${date.year}-${date.month}-${date.day}';

          // Her gün için öğlen 12:00 tahminini al
          if (date.hour == 12 && !dailyForecasts.containsKey(dayKey)) {
            dailyForecasts[dayKey] = ForecastModel.fromJson(item);
          }
        }

        return dailyForecasts.values.take(5).toList();
      } else {
        throw Exception('Günlük hava durumu tahmin verileri alınamadı');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }
}
