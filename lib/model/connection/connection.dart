import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/model/weather.dart';

///Connection with API data model
class WeatherAPI {
  final String apiKey = "8da1dd1d76ecfcaa345234ccb975690c";

  final dio = Dio();

  //{required String lat, required String lon}
  Future<WeatherModel> getWeather(
      {required double lat, required double lon}) async {
    try {
      final response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=pt_br");

      final data = response.data;

      return WeatherModel.fromJson(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Forecast> getForecastData(
      {required double lat, required double lon}) async {
    try {
      final response = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=pt_br");

      final data = response.data;

      return Forecast.fromJson(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
