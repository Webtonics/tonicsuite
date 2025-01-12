// Mock data
  import '../view/pages/subscription_page.dart';

final currentPlan = SubscriptionPlan(
    name: 'Professional',
    price: 29.99,
    interval: 'month',
    features: [
      'Up to 10 team members',
      'Advanced analytics',
      'Priority support',
      'Custom branding',
    ],
    isCurrent: true,
  );

  final List<SubscriptionPlan> availablePlans = [
    SubscriptionPlan(
      name: 'Basic',
      price: 9.99,
      interval: 'month',
      features: [
        'Single user',
        'Basic analytics',
        'Email support',
        'Standard features',
      ],
    ),
    SubscriptionPlan(
      name: 'Enterprise',
      price: 99.99,
      interval: 'month',
      features: [
        'Unlimited team members',
        'Enterprise analytics',
        '24/7 priority support',
        'Custom solutions',
        'Dedicated account manager',
      ],
    ),
  ];

  final List<BillingHistoryItem> billingHistory = [
    BillingHistoryItem(
      date: DateTime.now().subtract(const Duration(days: 0)),
      amount: 29.99,
      status: 'Paid',
      invoiceId: 'INV-001',
    ),
    BillingHistoryItem(
      date: DateTime.now().subtract(const Duration(days: 30)),
      amount: 29.99,
      status: 'Paid',
      invoiceId: 'INV-002',
    ),
    // Add more history items...
  ];