import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/forecast.dart';
import 'package:weather_app/screens/widgets/custom_card.dart';
import 'package:weather_app/screens/widgets/error_widget.dart';
import 'package:weather_app/util/weather_utils.dart';

///Build 3-per-3 hour forecast card
class HourlyForecast extends StatefulWidget {
  const HourlyForecast({super.key});

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  @override
  void initState() {
    context.read<WeatherController>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) => controller.hourlyForecast == null
          ? const Card(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: CustomErrorWidget(),
              ))
          : _buildHourlyForecast(forecast: controller.hourlyForecast!),
    );
  }

  Widget _buildHourlyForecast({required Forecast forecast}) {
    return CustomCard(
        text: 'PREVISÃO HORÁRIA',
        icon: CupertinoIcons.clock,
        showDivider: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              height: 100,
              width: double.maxFinite,
              child: _forecastInfo(forecast: forecast),
            ),
          )
        ]);
  }

  Widget _forecastInfo({required Forecast forecast}) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (context, index) => const SizedBox(width: 40),
        itemBuilder: (context, index) {
          final data = forecast.list?[index];

          String sunset = WeatherUtils.getSunset(
              sunset: forecast.city?.sunset ?? 0,
              index: index,
              forecast: forecast);

          return Row(
            children: [
              if (sunset != '') _buildSunsetWidget(sunset),
              Column(
                children: [
                  Text(
                    WeatherUtils.hourOfDay(date: data?.dtTxt ?? ''),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 10),
                  WeatherUtils.iconWeather(
                      weather: data?.weather?.first.description ?? ''),
                  const SizedBox(height: 10),
                  Text(WeatherUtils.roundToInt(data?.main?.temp ?? 0),
                      style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
            ],
          );
        });
  }

  Widget _buildSunsetWidget(String sunset) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              sunset,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            const Icon(CupertinoIcons.sunset_fill, color: Colors.amberAccent),
            const SizedBox(height: 10),
            const Text('Pôr do Sol'),
          ],
        ),
        const SizedBox(width: 40)
      ],
    );
  }
}
