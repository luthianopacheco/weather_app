import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/screens/widgets/custom_card.dart';
import 'package:weather_app/screens/widgets/error_widget.dart';
import 'package:weather_app/util/weather_utils.dart';

///Build card with the next days forecasts
class DailyForecast extends StatefulWidget {
  const DailyForecast({super.key});

  @override
  State<DailyForecast> createState() => _DailyForecastState();
}

class _DailyForecastState extends State<DailyForecast> {
  @override
  void initState() {
    context.read<WeatherController>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) => controller.dailyForecast.isEmpty
          ? const Card(
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: CustomErrorWidget()))
          : _buildDailyForecast(controller.dailyForecast),
    );
  }

  _buildDailyForecast(Map<dynamic, dynamic> dailyForecast) {
    return CustomCard(
        text: 'PREVISÃO PARA 10 DIAS',
        icon: CupertinoIcons.calendar,
        showDivider: true,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              itemCount: dailyForecast.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: Colors.white.withOpacity(0.1),
              ),
              itemBuilder: (context, index) {
                final element = dailyForecast.keys.elementAt(index);
                final daily = dailyForecast[element];
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(WeatherUtils.dayOfWeek(date: element)),
                          Column(
                            children: [
                              WeatherUtils.iconWeather(
                                  weather: daily['description']),
                              // Text(daily['pop'])
                            ],
                          ),
                          _buildMinMaxTemp(daily)
                        ]),
                  ],
                );
              },
            ),
          )
        ]);
  }

  _buildMinMaxTemp(dynamic daily) {
    return Row(
      children: [
        Text(
          daily['temp_min'],
          style: const TextStyle(color: Colors.lightBlueAccent),
        ),
        const SizedBox(width: 10),
        Container(
          height: 5,
          width: 150,
          decoration: BoxDecoration(
              color: WeatherUtils.getBarColor(daily['temp_max']),
              borderRadius: BorderRadius.circular(50)),
        ),
        const SizedBox(width: 10),
        SizedBox(width: 30, child: Text(daily['temp_max'])),
      ],
    );
  }
}
