import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(50, 0, 0, 0),
        highlightColor: const Color.fromARGB(34, 224, 224, 224),
        child: const Padding(
          padding: EdgeInsets.only(left: 12, top: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 85),
              SizedBox(
                height: 45,
                width: 170,
                child: Card(color: Colors.grey),
              ),
              SizedBox(
                height: 25,
                width: 80,
                child: Card(color: Colors.grey),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 90,
                width: 170,
                child: Card(color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 30,
                width: 140,
                child: Card(color: Colors.grey),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 30,
                width: 180,
                child: Card(color: Colors.grey),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 170,
                width: double.maxFinite,
                child: Card(color: Colors.grey),
              ),
              SizedBox(height: 5),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Card(color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }
}
