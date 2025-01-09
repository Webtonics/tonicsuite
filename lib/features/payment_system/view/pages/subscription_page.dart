import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Mock data models
class SubscriptionPlan {
  final String name;
  final double price;
  final String interval;
  final List<String> features;
  final bool isCurrent;

  SubscriptionPlan({
    required this.name,
    required this.price,
    required this.interval,
    required this.features,
    this.isCurrent = false,
  });
}

class BillingHistoryItem {
  final DateTime date;
  final double amount;
  final String status;
  final String invoiceId;

  BillingHistoryItem({
    required this.date,
    required this.amount,
    required this.status,
    required this.invoiceId,
  });
}

// Main subscription page widget
class SubscriptionPage extends StatelessWidget {
  SubscriptionPage({super.key});

  // Mock data
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

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    return SizedBox(
      height: 800,
      width: double.infinity,
      child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 32.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _buildCurrentPlan(context, isDesktop),
                            const SizedBox(height: 32),
                            _buildBillingHistory(context, isDesktop),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: _buildOtherPlans(context, isDesktop),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildCurrentPlan(context, isDesktop),
                      const SizedBox(height: 24),
                      _buildOtherPlans(context, isDesktop),
                      const SizedBox(height: 24),
                      _buildBillingHistory(context, isDesktop),
                    ],
                  ),
              ],
            ),
          ),
        
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscription',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manage your subscription and billing details',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentPlan(BuildContext context, bool isDesktop) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Plan',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          currentPlan.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'Active',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${currentPlan.price}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'per ${currentPlan.interval}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Features',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ...currentPlan.features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green[600], size: 20),
                  const SizedBox(width: 8),
                  Text(feature),
                ],
              ),
            )),
            const SizedBox(height: 24),
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.credit_card),
                  label: const Text('Update Payment Method'),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Cancel Subscription'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherPlans(BuildContext context, bool isDesktop) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Plans',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ...availablePlans.map((plan) => Column(
              children: [
                _buildPlanCard(context, plan),
                const SizedBox(height: 16),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, SubscriptionPlan plan) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plan.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '\$${plan.price}/${plan.interval}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...plan.features.map((feature) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const Icon(Icons.check, size: 20),
                const SizedBox(width: 8),
                Text(feature),
              ],
            ),
          )),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text(
                'Switch to ${plan.name}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillingHistory(BuildContext context, bool isDesktop) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Invoice')),
                ],
                rows: billingHistory.map((item) => DataRow(
                  cells: [
                    DataCell(Text(
                      DateFormat('MMM d, yyyy').format(item.date),
                    )),
                    DataCell(Text('\$${item.amount}')),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: item.status == 'Paid'
                              ? Colors.green[100]
                              : Colors.orange[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          item.status,
                          style: TextStyle(
                            color: item.status == 'Paid'
                                ? Colors.green[700]
                                : Colors.orange[700],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download, size: 16),
                        label: Text(item.invoiceId),
                      ),
                    ),
                  ],
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}