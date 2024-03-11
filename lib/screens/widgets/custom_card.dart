import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  final List<Widget> children;
  final bool showDivider;
  const CustomCard(
      {super.key,
      required this.text,
      this.icon,
      required this.children,
      this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleCardText(context),
            showDivider
                ? Divider(color: Colors.white.withOpacity(0.1))
                : const SizedBox(height: 12),
            ...children
          ],
        ),
      ),
    );
  }

  _titleCardText(BuildContext context) {
    return Row(
      children: [
        icon == null
            ? const SizedBox()
            : Icon(
                icon,
                color: Colors.white.withOpacity(0.7),
                size: 18,
              ),
        const SizedBox(width: 12),
        Text(text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(0.7))),
      ],
    );
  }
}
