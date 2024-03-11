import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/util/weather_utils.dart';

//TODO: functionality
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.white.withOpacity(0.2)))),
      child: NavigationBar(
        elevation: 5,
        height: 55,
        selectedIndex: 1,
        indicatorColor: Colors.transparent,
        backgroundColor: WeatherUtils.isMorning()
            ? Colors.blueAccent
            : const Color(0xff053352),
        destinations: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(
                CupertinoIcons.map,
                color: Colors.white,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: NavigationDestination(
                label: '',
                icon: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location_fill,
                      color: Colors.white,
                      size: 15,
                    ),
                    const SizedBox(width: 10),
                    _buildContainerNavigator(),
                    const SizedBox(width: 10),
                    _buildContainerNavigator(),
                    const SizedBox(width: 10),
                    _buildContainerNavigator(),
                    const SizedBox(width: 10),
                    _buildContainerNavigator(),
                    const SizedBox(width: 10),
                    _buildContainerNavigator(),
                  ],
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(
                CupertinoIcons.list_bullet,
                color: Colors.white,
              ),
              label: '',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainerNavigator() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
    );
  }
}
