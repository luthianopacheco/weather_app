import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/screens/widgets/error_widget.dart';
import 'package:weather_app/util/capitalize_extension.dart';

///Main weather info, with local, temperature, degrees and max/min temperature
class MainWeather extends StatefulWidget {
  const MainWeather({super.key});

  @override
  State<MainWeather> createState() => _MainWeatherState();
}

class _MainWeatherState extends State<MainWeather> {
  @override
  void initState() {
    context.read<WeatherController>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) => controller.mainWeather == null
          ? const SizedBox(height: 380, child: CustomErrorWidget())
          : _buildMainWeather(weather: controller.mainWeather!),
    );
  }

  Widget _buildMainWeather({required WeatherModel weather}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Text('Meu Local', style: Theme.of(context).textTheme.headlineLarge),
          Text(weather.name?.toUpperCase() ?? '',
              style: Theme.of(context).textTheme.bodyMedium),
          Text("${weather.main?.temp?.round().toString() ?? '0'}º",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 100)),
          Text(weather.weather?.first.description?.capitalize() ?? '',
              style: Theme.of(context).textTheme.headlineSmall),
          Text(
              'Máx.: ${weather.main?.tempMax?.round() ?? 0} Mín.: ${weather.main?.tempMin?.round() ?? '0'}',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
