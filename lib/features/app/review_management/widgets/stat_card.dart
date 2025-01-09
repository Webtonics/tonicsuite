import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String change;
  final bool isPositive;

  const StatCard({super.key, 
    required this.icon,
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: AppColors.primaryColor),
                Text(
                  change,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(value,
                 style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: 4),
            Text(title,
                 style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

