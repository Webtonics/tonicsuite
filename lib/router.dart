// lib/routes/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:tonic_suite/features/payment_system/view/pages/subscription_page.dart';
import 'features/app/review_management/pages/dashboard.dart';
import 'features/app/review_management/pages/customers.dart';
import 'features/app/review_management/pages/review_request.dart';
import 'features/app/review_management/pages/reviews_page.dart';
import 'features/app/review_management/pages/settings.dart';
import 'features/app/review_management/review_mgt.dart';
import 'features/app/review_management/utils/new_request_pop.dart';

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
          GoRoute(
            path: '/subscription',
            name: 'subscription',
            builder: (context, state) =>  SubscriptionPage(),
          ),
        ],
      ),
    ],
  );
}