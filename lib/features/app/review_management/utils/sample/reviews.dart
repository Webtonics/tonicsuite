// Example data
  import '../../models/review_model.dart';

final List<Review> reviews = [
    Review(
      id: '1',
      customerName: 'John Doe',
      rating: 4.5,
      review: 'Great service! Would recommend.',
      platform: 'Google',
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Review(
      id: '2',
      customerName: 'Jane Smith',
      rating: 5.0,
      review: 'Excellent experience overall.',
      platform: 'Facebook',
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  final List<String> platforms = ['All Platforms', 'Google', 'Facebook', 'Yelp'];
  final List<String> sortOptions = [
    'Most Recent',
    'Oldest First',
    'Highest Rating',
    'Lowest Rating',
  ];

  final List<String> responseTemplates = [
    'Thank you for your positive feedback!',
    'We appreciate your review and feedback.',
    'We\'re sorry for your experience. Please contact us directly to resolve this.',
  ];