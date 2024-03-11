import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/forecast.dart';

///Weather utilities
class WeatherUtils extends ChangeNotifier {
  ///Check if is morning or not
  static bool isMorning() {
    var now = DateTime.now();

    if (now.hour > 18 || now.hour < 6) {
      return false;
    }
    return true;
  }

  ///Round double value to int and return value with degree symbol
  static String roundToInt(double value) {
    String newValue = value.round().toString();
    return '$newValueº';
  }

  ///Convert a String date value to obtain its hour
  static String hourOfDay({required String date}) {
    String hour = DateTime.parse(date).hour.toInt().toString();
    if (hour.length == 1) {
      return '0$hour';
    }
    return hour;
  }

  ///Get sunset hour.
  //Note: For some reason, sunrise api value is the same of sunset value.
  static String getSunset(
      {required int sunset, required int index, required Forecast forecast}) {
    if (index == 0) {
      return '';
    }

    String previousHour = forecast.list?[index - 1].dtTxt ?? '';
    String nextHour = forecast.list?[index].dtTxt ?? '';
    String currentDate = forecast.list?[index].dtTxt?.split(' ')[0] ?? '';
    String sunsetTime =
        DateTime.fromMillisecondsSinceEpoch(sunset).toString().split(' ')[1];

    DateTime dateTime = DateTime.parse('$currentDate $sunsetTime');
    DateTime previous = DateTime.parse(previousHour);
    DateTime next = DateTime.parse(nextHour);

    sunsetTime = DateFormat('Hm').format(dateTime);

    if (dateTime.isAfter(previous) && dateTime.isBefore(next)) {
      return sunsetTime;
    }

    return '';
  }

  static String dayOfWeek({required String date}) {
    // return initializeDateFormatting('pt_BR', null).then((value) =>
    //   DateFormat('E', 'pt_PT').format(DateTime.parse(date)));
    var formated = DateFormat('E').format(DateTime.parse(date));
    switch (formated.toLowerCase()) {
      case 'mon':
        return 'Seg.';
      case 'tue':
        return 'Ter.';
      case 'wed':
        return 'Qua.';
      case 'thu':
        return 'Qui.';
      case 'fri':
        return 'Sex.';
      case 'sat':
        return 'Sáb.';
      case 'sun':
        return 'Dom.';
      default:
        return '';
    }
  }

  static Color getBarColor(String max) {
    if (max.contains('-')) {
      return Colors.blue[700]!;
    }

    var data = double.parse(max.split('º')[0]);
    if (data < 10) {
      return Colors.blue[700]!;
    }

    return Colors.orange;
  }

  static Icon iconWeather({required String weather}) {
    switch (weather.toLowerCase()) {
      case 'trovoada':
        return const Icon(
          CupertinoIcons.cloud_bolt_fill,
          color: Colors.grey,
        );
      case 'chuva':
        return const Icon(
          CupertinoIcons.cloud_heavyrain_fill,
          color: Colors.grey,
        );
      case 'chuva leve':
        return const Icon(
          CupertinoIcons.cloud_drizzle_fill,
          color: Colors.grey,
        );
      case 'nublado' || 'nuvens dispersas':
        return const Icon(
          CupertinoIcons.cloud_fill,
          color: Colors.grey,
        );
      case 'céu limpo':
        return Icon(
          isMorning() ? CupertinoIcons.sun_max_fill : CupertinoIcons.moon_fill,
          color: isMorning() ? Colors.amberAccent : Colors.white,
        );
      case 'neve' || 'pouca neve':
        return const Icon(
          CupertinoIcons.snow,
          color: Colors.white,
        );
      case 'névoa':
        return const Icon(
          CupertinoIcons.cloud_fog_fill,
          color: Colors.grey,
        );
      default:
        return Icon(
          isMorning()
              ? CupertinoIcons.cloud_sun_fill
              : CupertinoIcons.cloud_moon_fill,
          color: Colors.amberAccent,
        );
    }
  }
}
