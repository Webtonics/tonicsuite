import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';
import 'widgets/nav_item.dart';

class ReviewManagement extends StatelessWidget {
  final Widget child;

  const ReviewManagement({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    // final isTablet = screenWidth > 768 && screenWidth <= 1024;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        drawer: !isDesktop ? _buildDrawer(context, currentLocation) : null,
        appBar: !isDesktop
            ? AppBar(
                title: Row(
                  children: [
                    Icon(Icons.dashboard_customize, color: AppColors.primaryColor),
                    SizedBox(width: 8),
                    Text('Revio'),
                  ],
                ),
              )
            : null,
        body: Column(
          children: [
            
            Expanded(
              
              child: Row(
                children: [
                  // Left Sidebar - only show on desktop
                  if (isDesktop) _buildDrawer(context, currentLocation),
                  
                  // Main Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, String currentLocation) {
    return Container(
      width: 250,
      // color: Colors.white,
      color: Color.fromRGBO(1, 23, 34,1),
      child: ListView(
        children: [
          if (!MediaQuery.of(context).size.width.isFinite) 
             SizedBox(height: MediaQuery.paddingOf(context).top),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.dashboard_customize, color: AppColors.primaryColor),
                SizedBox(width: 8),
                Text('Revio', style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
          NavigationItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            route: '/dashboard',
            isSelected: currentLocation == '/dashboard',
          ),
          NavigationItem(
            icon: Icons.rate_review,
            title: 'Reviews',
            route: '/reviews',
            isSelected: currentLocation == '/reviews',
          ),
          NavigationItem(
            icon: Icons.request_page,
            title: 'Review Requests',
            route: '/review-requests',
            isSelected: currentLocation == '/review-requests',
          ),
          // NavigationItem(
          //   icon: Icons.people,
          //   title: 'Customers',
          //   route: '/customers',
          //   isSelected: currentLocation == '/customers',
          // ),
          NavigationItem(
            icon: Icons.settings,
            title: 'Settings',
            route: '/settings',
            isSelected: currentLocation == '/settings',
          ),
          NavigationItem(
            icon: Icons.settings,
            title: 'Subscription',
            route: '/subscription',
            isSelected: currentLocation == '/subscription',
          ),
          const Divider(
            color: Colors.transparent,
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('unilodge6@gmail.com',
                     style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8),
                OutlinedButton.icon(
                  icon: Icon(Icons.logout),
                  label: Text('Sign Out'),
                  onPressed: () {
                    // Add your sign out logic here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

