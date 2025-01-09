

import 'package:flutter/material.dart';

import '../widgets/section_card.dart';
import '../widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboard',
               style: Theme.of(context).textTheme.displayMedium),
          SizedBox(height: 8),
          Text("Welcome back! Here's what's happening with your reviews.",
               style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 24),
          
          // Responsive Stats Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final crossAxisCount = width > 1200 
                  ? 4 
                  : width > 800 
                      ? 3
                      : 1;
              
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: width > 1200 ? 1.5 : 1.8,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  StatCard(
                    icon: Icons.message,
                    title: 'Total Reviews',
                    value: '1,234',
                    change: '+12.3%',
                    isPositive: true,
                  ),
                  StatCard(
                    icon: Icons.star,
                    title: 'Average Rating',
                    value: '4.8',
                    change: '+0.2',
                    isPositive: true,
                  ),
                  StatCard(
                    icon: Icons.thumb_up,
                    title: 'Response Rate',
                    value: '92%',
                    change: '-2.1%',
                    isPositive: false,
                  ),
                  StatCard(
                    icon: Icons.people,
                    title: 'Active Customers',
                    value: '856',
                    change: '+5.4%',
                    isPositive: true,
                  ),
                ],
              );
            },
          ),
          
          SizedBox(height: 24),
          
          // Responsive Bottom Section
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              if (width > 768) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SectionCard(
                        title: 'Recent Reviews',
                        child: Container(), // Add your reviews list here
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: SectionCard(
                        title: 'Rating Distribution',
                        child: Container(), // Add your rating chart here
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    SectionCard(
                      title: 'Recent Reviews',
                      child: Container(), // Add your reviews list here
                    ),
                    SizedBox(height: 24),
                    SectionCard(
                      title: 'Rating Distribution',
                      child: Container(), // Add your rating chart here
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

