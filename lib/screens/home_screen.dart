import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/screens/components/bottom_navigation.dart';
import 'package:weather_app/screens/components/daily_forecast.dart';
import 'package:weather_app/screens/components/generics_components.dart';
import 'package:weather_app/screens/components/hourly_forecast.dart';
import 'package:weather_app/screens/components/main_weather.dart';
import 'package:weather_app/screens/widgets/error_widget.dart';
import 'package:weather_app/screens/widgets/shimmer_screen.dart';
import 'package:weather_app/util/weather_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<WeatherController>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image(
                image: AssetImage(WeatherUtils.isMorning()
                    ? 'assets/images/dia.jpg'
                    : 'assets/images/noite.jpg'),
                fit: BoxFit.cover),
          ),
          Consumer<WeatherController>(
            builder: (context, controller, child) {
              final error = context.watch<WeatherController>();
              if (error.errorMessage != '') {
                return CustomErrorWidget(
                  errorMessage: error.errorMessage,
                );
              }
              if (controller.mainWeather == null) {
                Timer(
                    const Duration(seconds: 5),
                    () => setState(() {
                          controller.isVisible = false;
                        }));
                return controller.isVisible
                    ? const ShimmerScreen()
                    : const CustomErrorWidget();
              }

              return const SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        MainWeather(),
                        HourlyForecast(),
                        DailyForecast(),
                        GenericsComponents()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
