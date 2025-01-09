import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewReviewRequestDialog extends StatefulWidget {
  const NewReviewRequestDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewReviewRequestDialogState createState() => _NewReviewRequestDialogState();
}

class _NewReviewRequestDialogState extends State<NewReviewRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  String? selectedPlatform = 'Google';
  String? selectedTemplate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        width: 600,
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Review Request',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24),
              
              // Two-column layout
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customer Name'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'John Doe',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email Address'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'customer@example.com',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone Number (Optional)'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '+1 (555) 000-0000',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Platform'),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedPlatform,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: ['Google', 'Facebook', 'Yelp']
                              .map((platform) => DropdownMenuItem(
                                    value: platform,
                                    child: Text(platform),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedPlatform = value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Review Template'),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedTemplate,
                          decoration: InputDecoration(
                            hintText: 'Select a template',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Default Template', 'Custom Template']
                              .map((template) => DropdownMenuItem(
                                    value: template,
                                    child: Text(template),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedTemplate = value);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Follow-up After (Days)'),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '7',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              Text('Notes (Optional)'),
              SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Add any additional notes about this review request...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.go('/review-requests'),
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Send Request'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}