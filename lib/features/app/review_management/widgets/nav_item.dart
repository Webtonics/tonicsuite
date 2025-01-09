import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final bool isSelected;

  const NavigationItem({super.key, 
    required this.icon,
    required this.title,
    required this.route,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? AppColors.primaryColor.withOpacity(0.1) : null,
      child: ListTile(
        leading: Icon(icon,
                     color: isSelected ? AppColors.secondaryLightColor : Color.fromRGBO(242, 243, 225, 1)),
        title: Text(title,
                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                     color: isSelected ? const Color.fromARGB(255, 232, 226, 247) : Color.fromRGBO(242, 243, 225, 1),
                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                   )),
        selected: isSelected,
        onTap: () => context.go(route),
      ),
    );
  }
}