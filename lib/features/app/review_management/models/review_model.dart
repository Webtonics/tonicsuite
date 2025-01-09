class Review {
  final String id;
  final String customerName;
  final double rating;
  final String review;
  final String platform;
  final DateTime date;
  final String? response;

  Review({
    required this.id,
    required this.customerName,
    required this.rating,
    required this.review,
    required this.platform,
    required this.date,
    this.response,
  });
}
