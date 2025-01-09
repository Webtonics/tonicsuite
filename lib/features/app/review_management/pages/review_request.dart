import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/screen_breakpoints.dart';
import '../widgets/reviews_stat_card.dart';

class ReviewRequestsPage extends StatelessWidget {
   const ReviewRequestsPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    // final currentLocation = GoRouterState.of(context).uri.toString();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildStatsCards(context),
            const SizedBox(height: 24),
            _buildRequestsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ResponsiveWidget(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review Requests', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 8),
          Text('Manage and send review requests to your customers',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          _buildNewRequestButton(context),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Review Requests', style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(height: 8),
              Text('Manage and send review requests to your customers',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          _buildNewRequestButton(context),
        ],
      ),
    );
  }

  Widget _buildNewRequestButton(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        context.go('/new-request');
      },
      icon: const Icon(Icons.add),
      label: const Text('New Request'),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context) {
    return ResponsiveWidget(
      mobile: Column(
        children: [
          ..._buildStatCardsList(),
        ],
      ),
      tablet: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: _buildStatCardsList()
            .map((card) => SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) ,
                  child: card,
                ))
            .toList(),
      ),
      desktop: Row(
        children: _buildStatCardsList()
            .expand((card) => [
                  Expanded(child: card),
                  const SizedBox(width: 16),
                ])
            .take(_buildStatCardsList().length * 2 -1)
            .toList(),
      ),
    );
  }

  List<Widget> _buildStatCardsList() {
    return [
      RStatCard(
        icon: Icons.request_page,
        iconColor: AppColors.primaryColor,
        title: 'Total Requests',
        value: '0',
        subtitle: 'Total Requests',
      ),
      RStatCard(
        icon: Icons.pending,
        iconColor: Colors.orange,
        title: 'Pending',
        value: '0',
        subtitle: 'Pending',
      ),
      RStatCard(
        icon: Icons.check_circle,
        iconColor: Colors.green,
        title: 'Completed',
        value: '0',
        subtitle: 'Completed',
      ),
      RStatCard(
        icon: Icons.star,
        iconColor: Colors.purple,
        title: 'Conversion Rate',
        value: '0%',
        subtitle: 'Conversion Rate',
      ),
    ];
  }

  Widget _buildRequestsList(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.request_page_outlined,
                  size: 64, color: AppColors.textSecondaryColor),
              const SizedBox(height: 16),
              Text('No Review Requests Yet',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Create your first review request to get started',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create Request'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ScreenBreakpoints.desktop) {
          return desktop;
        } else if (constraints.maxWidth >= ScreenBreakpoints.tablet) {
          return tablet ?? desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}