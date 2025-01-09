// lib/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'pages/dashboard.dart';
import 'pages/customers.dart';
import 'pages/review_request.dart';
import 'pages/reviews_page.dart';
import 'pages/settings.dart';
import 'review_mgt.dart';
import 'utils/new_request_pop.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        builder: (context, state, child) => ReviewManagement(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/reviews',
            name: 'reviews',
            builder: (context, state) => const ReviewsPage(),
          ),
          GoRoute(
            path: '/review-requests',
            name: 'review-requests',
            builder: (context, state) => const ReviewRequestsPage(),
          ),
          GoRoute(
            path: '/customers',
            name: 'customers',
            builder: (context, state) => const CustomersPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: '/new-request',
            name: 'new-request',
            builder: (context, state) => const NewReviewRequestDialog(),
          ),
        ],
      ),
    ],
  );
}