import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/connection/connection.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/util/custom_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => WeatherAPI()),
        ChangeNotifierProvider(
            create: (context) => WeatherController(context.read()))
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: CustomTheme.theme(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
