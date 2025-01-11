import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(context),
            
            const SizedBox(height: 24),
            
            // Content Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Review Templates Section
                    _buildTemplatesSection(context, isDesktop, isTablet),
                    
                    const SizedBox(height: 24),
                    
                    // Account Settings Section
                    _buildAccountSettings(context, isDesktop),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Manage your account and preferences',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildTemplatesSection(BuildContext context, bool isDesktop, bool isTablet) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTemplatesHeader(context, isDesktop),
            const SizedBox(height: 16),
            _buildTemplatesContent(context, isDesktop),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplatesHeader(BuildContext context, bool isDesktop) {
    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTemplatesTitle(context),
          _buildNewTemplateButton(),
        ],
      );
    }

    // Mobile/Tablet layout
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTemplatesTitle(context),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: _buildNewTemplateButton(),
        ),
      ],
    );
  }

  Widget _buildTemplatesTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Templates',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          'Manage your review request templates',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildNewTemplateButton() {
    return FilledButton.icon(
      onPressed: () {
        // Handle new template
      },
      icon: const Icon(Icons.add),
      label: const Text('New Template'),
    );
  }

  Widget _buildTemplatesContent(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 16.0 : 12.0),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red[700]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Failed to load templates. Please try again later.',
              style: TextStyle(color: Colors.red[700]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context, bool isDesktop) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: isDesktop ? 48 : 32),
            _buildComingSoon(context),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.settings,
            size: 48,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Coming Soon',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Account settings will be available soon',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

