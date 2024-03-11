import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/model/connection/connection.dart';
import 'package:weather_app/model/weather.dart';

class WeatherController extends ChangeNotifier {
  final WeatherAPI _api;
  WeatherController(this._api);

  String errorMessage = '';
  bool isVisible = true;
  WeatherModel? mainWeather;
  Forecast? hourlyForecast;
  Map<dynamic, dynamic> dailyForecast = {};

  ///Get data for main weather and hourly and daily forecast
  Future<void> getWeather() async {
    final position = await getPosition();

    mainWeather =
        await _api.getWeather(lat: position.latitude, lon: position.longitude);
    hourlyForecast = await _api.getForecastData(
        lat: position.latitude, lon: position.longitude);

    if (hourlyForecast?.list != null) {
      _getDailyForecast(forecast: hourlyForecast!.list!);
    }

    notifyListeners();
  }

  ///Filter forecasts day by day
  void _getDailyForecast({required List<FList> forecast}) {
    double min = 100.0;
    double max = -100.0;
    String date = '';

    for (var e in forecast) {
      String formated = e.dtTxt?.split(' ')[0] ?? '';

      if (date == '') {
        date = formated;
      }

      if (date == formated) {
        if (e.main?.tempMin != null) {
          if (e.main!.tempMin! < min) {
            min = e.main!.tempMin!.toDouble();
          }
        }
        if (e.main?.tempMax != null) {
          if (e.main!.tempMax! > max) {
            max = e.main!.tempMax!.toDouble();
          }
        }
      } else {
        dailyForecast.putIfAbsent(
            e.dtTxt,
            () => {
                  'description': e.weather?.first.description,
                  'temp_min': '${min.toString().split('.')[0]}º',
                  'temp_max': '${max.toString().split('.')[0]}º'
                });
        min = 100.0;
        max = -100.0;
        date = formated;
      }
    }
    debugPrint(dailyForecast.toString());
  }

  ///Get permission to get the current user position
  Future<Position> getPosition() async {
    bool isActive = await Geolocator.isLocationServiceEnabled();
    if (!isActive) {
      notifyListeners();
      return Future.error(
          errorMessage = 'Por favor, habilite a localização no smartphone');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      notifyListeners();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        notifyListeners();
        return Future.error(
            errorMessage = 'É preciso autorizar o acesso à localização');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      notifyListeners();
      return Future.error(errorMessage =
          'É preciso autorizar o acesso à localização nas configurações do celular');
    }
    notifyListeners();
    return await Geolocator.getCurrentPosition();
  }
}
