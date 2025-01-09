import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 200,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryDarkColor
      ),
    );
  }
}
