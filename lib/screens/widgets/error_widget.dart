import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Build a centered icon and text error
class CustomErrorWidget extends StatelessWidget {
  final String? errorMessage;
  const CustomErrorWidget({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            errorMessage == null
                ? CupertinoIcons.wifi_exclamationmark
                : CupertinoIcons.gear_alt,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(height: 15),
          Text(
            errorMessage ?? "Error. No data found",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
