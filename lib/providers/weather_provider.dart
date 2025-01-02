import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import '../models/forecast_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _currentWeather;
  List<ForecastModel> _hourlyForecast = [];
  List<ForecastModel> _dailyForecast = [];
  bool _isLoading = false;
  String? _error;

  WeatherModel? get currentWeather => _currentWeather;
  List<ForecastModel> get hourlyForecast => _hourlyForecast;
  List<ForecastModel> get dailyForecast => _dailyForecast;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getCurrentLocationWeather() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Konum izni kontrolü
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Konum izni reddedildi');
        }
      }

      // Mevcut konumu al
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Hava durumu verilerini al
      _currentWeather = await _weatherService.getWeatherByLocation(
        position.latitude,
        position.longitude,
      );

      // Saatlik tahmin verilerini al
      _hourlyForecast = await _weatherService.getHourlyForecast(
        position.latitude,
        position.longitude,
      );

      // Günlük tahmin verilerini al
      _dailyForecast = await _weatherService.getDailyForecast(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getWeatherByCity(String city) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentWeather = await _weatherService.getWeatherByCity(city);

      // Şehrin koordinatlarını kullanarak tahmin verilerini al
      if (_currentWeather != null) {
        final lat = _currentWeather!.lat;
        final lon = _currentWeather!.lon;

        _hourlyForecast = await _weatherService.getHourlyForecast(lat, lon);
        _dailyForecast = await _weatherService.getDailyForecast(lat, lon);
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
