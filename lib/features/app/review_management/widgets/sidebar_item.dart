import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const SidebarItem({super.key, 
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? AppColors.primaryColor.withOpacity(0.1) : null,
      child: ListTile(
        leading: Icon(icon,
                     color: isSelected ? AppColors.primaryColor : AppColors.textSecondaryColor),
        title: Text(title,
                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                     color: isSelected ? AppColors.primaryColor : AppColors.textSecondaryColor,
                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                   )),
        selected: isSelected,
      ),
    );
  }
}