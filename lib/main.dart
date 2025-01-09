import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:flutter/material.dart';
// import 'package:tonic_suite/features/app/missed_call_feature/dashboard.dart';
// import 'package:tonic_suite/features/app/review_management/dashboard.dart';
import 'package:tonic_suite/features/app/review_management/router.dart';

import 'constants/theme.dart';

void main() {

  //Set path Url Strategy
  setPathUrlStrategy();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Tonics Suite',
    //   theme: ThemeData(
        
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   // home: DashboardScreen(),
    //   home:ReviewManagement(child: null,),
    // );

    return MaterialApp.router(
      title: 'Revio Dashboard',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
