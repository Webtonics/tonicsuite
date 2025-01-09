// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../models/review_model.dart';
// import '../utils/sample/reviews.dart';


// class ReviewsPage extends StatefulWidget {
//   const ReviewsPage({super.key});

//   @override
//   State<ReviewsPage> createState() => _ReviewsPageState();
// }

// class _ReviewsPageState extends State<ReviewsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedPlatform = 'All Platforms';
//   String _selectedSort = 'Most Recent';
//   bool _showFilters = false;

  

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _searchController.dispose();
//     super.dispose();
//   }

//   // Analytics calculations
//   Map<String, dynamic> get analytics {
//     if (reviews.isEmpty) return {};
    
//     final averageRating = reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;
//     final platformCounts = { for (var p in platforms.where((p) => p != 'All Platforms')) p : reviews.where((r) => r.platform == p).length };
    
//     return {
//       'averageRating': averageRating,
//       'totalReviews': reviews.length,
//       'platformCounts': platformCounts,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 800,
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Section with Search and Filter
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Reviews',
//                         style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'Manage and respond to your customer reviews',
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 SizedBox(
//                   width: 300,
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search reviews...',
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         // Implement search logic
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 FilledButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       _showFilters = !_showFilters;
//                     });
//                   },
//                   icon: Icon(Icons.filter_list),
//                   label: Text('Filter'),
//                   style: FilledButton.styleFrom(
//                     backgroundColor: _showFilters ? Colors.blue : Colors.white,
//                     foregroundColor: _showFilters ? Colors.white : Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
            
//             if (_showFilters) ...[
//               SizedBox(height: 16),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: DropdownButtonFormField<String>(
//                           value: _selectedPlatform,
//                           decoration: InputDecoration(
//                             labelText: 'Platform',
//                             border: OutlineInputBorder(),
//                           ),
//                           items: platforms.map((platform) {
//                             return DropdownMenuItem(
//                               value: platform,
//                               child: Text(platform),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedPlatform = value!;
//                             });
//                           },
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: DropdownButtonFormField<String>(
//                           value: _selectedSort,
//                           decoration: InputDecoration(
//                             labelText: 'Sort By',
//                             border: OutlineInputBorder(),
//                           ),
//                           items: sortOptions.map((option) {
//                             return DropdownMenuItem(
//                               value: option,
//                               child: Text(option),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedSort = value!;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
      
//             SizedBox(height: 24),
      
//             // Analytics Cards
//             Row(
//               children: [
//                 Expanded(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.star, color: Colors.amber),
//                               SizedBox(width: 8),
//                               Text(
//                                 analytics['averageRating']?.toStringAsFixed(1) ?? '0.0',
//                                 style: Theme.of(context).textTheme.headlineSmall,
//                               ),
//                             ],
//                           ),
//                           Text('Average Rating'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             analytics['totalReviews']?.toString() ?? '0',
//                             style: Theme.of(context).textTheme.headlineSmall,
//                           ),
//                           Text('Total Reviews'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.speed, color: Colors.green),
//                               SizedBox(width: 8),
//                               Text(
//                                 '94%',
//                                 style: Theme.of(context).textTheme.headlineSmall,
//                               ),
//                             ],
//                           ),
//                           Text('Response Rate'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
      
//             SizedBox(height: 24),
      
//             // Reviews List
//             Expanded(
//               child: Card(
//                 child: Column(
//                   children: [
//                     TabBar(
//                       controller: _tabController,
//                       tabs: [
//                         Tab(text: 'All Reviews'),
//                         Tab(text: 'Needs Response'),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         controller: _tabController,
//                         children: [
//                           _buildReviewsList(reviews),
//                           _buildReviewsList(reviews.where((r) => r.response == null).toList()),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReviewsList(List<Review> reviews) {
//     if (reviews.isEmpty) {
//       return Center(
//         child: Text('No reviews to display'),
//       );
//     }

//     return ListView.separated(
//       padding: EdgeInsets.all(16),
//       itemCount: reviews.length,
//       separatorBuilder: (context, index) => Divider(),
//       itemBuilder: (context, index) => ReviewCard(
//         review: reviews[index],
//         onReply: (review) => _showReplyDialog(review),
//       ),
//     );
//   }

//   void _showReplyDialog(Review review) {
//     final TextEditingController replyController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         child: Container(
//           width: 600,
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Reply to Review',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               SizedBox(height: 16),
//               Text('Response Templates:'),
//               SizedBox(height: 8),
//               Wrap(
//                 spacing: 8,
//                 children: responseTemplates.map((template) {
//                   return ActionChip(
//                     label: Text('${template.substring(0, 20)}...'),
//                     onPressed: () {
//                       replyController.text = template;
//                     },
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: replyController,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Type your response...',
//                 ),
//               ),
//               SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text('Cancel'),
//                   ),
//                   SizedBox(width: 16),
//                   FilledButton(
//                     onPressed: () {
//                       // Implement reply logic
//                       Navigator.pop(context);
//                     },
//                     child: Text('Send Reply'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ReviewCard extends StatelessWidget {
//   final Review review;
//   final Function(Review) onReply;

//   const ReviewCard({
//     required this.review,
//     required this.onReply,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   child: Text(review.customerName[0]),
//                 ),
//                 SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         review.customerName,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       Row(
//                         children: [
//                           ...List.generate(
//                             5,
//                             (index) => Icon(
//                               Icons.star,
//                               size: 16,
//                               color: index < review.rating 
//                                   ? Colors.amber 
//                                   : Colors.grey[300],
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             review.platform,
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                           Text(' • '),
//                           Text(
//                             '${review.date.day}/${review.date.month}/${review.date.year}',
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.more_vert),
//                   onPressed: () {
//                     // Show more options
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             Text(review.review),
//             if (review.response != null) ...[
//               SizedBox(height: 12),
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Your Response:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 4),
//                     Text(review.response!),
//                   ],
//                 ),
//               ),
//             ],
//             SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (review.response == null)
//                   TextButton.icon(
//                     icon: Icon(Icons.reply),
//                     label: Text('Reply'),
//                     onPressed: () => onReply(review),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/review_model.dart';
import '../utils/sample/reviews.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _selectedPlatform = 'All Platforms';
  String _selectedSort = 'Most Recent';
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  // Analytics calculations
  Map<String, dynamic> get analytics {
    if (reviews.isEmpty) return {};
    
    final averageRating = reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;
    final platformCounts = { for (var p in platforms.where((p) => p != 'All Platforms')) p : reviews.where((r) => r.platform == p).length };
    
    return {
      'averageRating': averageRating,
      'totalReviews': reviews.length,
      'platformCounts': platformCounts,
    };
  }

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
            // Header Section with Search and Filter
            _buildHeader(isDesktop, isTablet),
            
            if (_showFilters) ...[
              SizedBox(height: 16),
              _buildFilters(isDesktop),
            ],
      
            SizedBox(height: 24),
      
            // Analytics Cards
            _buildAnalyticsCards(isDesktop, isTablet),
      
            SizedBox(height: 24),
      
            // Reviews List
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'All Reviews'),
                        Tab(text: 'Needs Response'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildReviewsList(reviews),
                          _buildReviewsList(reviews.where((r) => r.response == null).toList()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDesktop, bool isTablet) {
    if (isDesktop) {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manage and respond to your customer reviews',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 300,
            child: _buildSearchField(),
          ),
          SizedBox(width: 16),
          _buildFilterButton(),
        ],
      );
    }

    // Mobile/Tablet layout
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Manage and respond to your customer reviews',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildSearchField()),
            SizedBox(width: 8),
            _buildFilterButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search reviews...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        setState(() {
          // Implement search logic
        });
      },
    );
  }

  Widget _buildFilterButton() {
    return FilledButton.icon(
      onPressed: () {
        setState(() {
          _showFilters = !_showFilters;
        });
      },
      icon: Icon(Icons.filter_list),
      label: Text('Filter'),
      style: FilledButton.styleFrom(
        backgroundColor: _showFilters ? Colors.blue : Colors.white,
        foregroundColor: _showFilters ? Colors.white : Colors.black87,
      ),
    );
  }

  Widget _buildFilters(bool isDesktop) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _selectedPlatform,
                decoration: InputDecoration(
                  labelText: 'Platform',
                  border: OutlineInputBorder(),
                ),
                items: platforms.map((platform) {
                  return DropdownMenuItem(
                    value: platform,
                    child: Text(platform),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPlatform = value!;
                  });
                },
              ),
            ),
            SizedBox(width: isDesktop ? 16 : 0, height: isDesktop ? 0 : 16),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _selectedSort,
                decoration: InputDecoration(
                  labelText: 'Sort By',
                  border: OutlineInputBorder(),
                ),
                items: sortOptions.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSort = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsCards(bool isDesktop, bool isTablet) {
    final cards = [
      _buildAnalyticsCard(
        icon: Icons.star,
        iconColor: Colors.amber,
        value: analytics['averageRating']?.toStringAsFixed(1) ?? '0.0',
        label: 'Average Rating',
      ),
      _buildAnalyticsCard(
        value: analytics['totalReviews']?.toString() ?? '0',
        label: 'Total Reviews',
      ),
      _buildAnalyticsCard(
        icon: Icons.speed,
        iconColor: Colors.green,
        value: '94%',
        label: 'Response Rate',
      ),
    ];

    if (isDesktop) {
      return Row(
        children: cards.map((card) => Expanded(child: card)).toList(),
      );
    }

    // Mobile/Tablet layout
    return Column(
      children: cards.map((card) => Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: SizedBox(width: double.infinity, child: card),
      )).toList(),
    );
  }

  Widget _buildAnalyticsCard({
    IconData? icon,
    Color? iconColor,
    required String value,
    required String label,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: iconColor),
                  SizedBox(width: 8),
                ],
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Text(label),
          ],
        ),
      ),
    );
  }

  // Rest of the existing methods remain the same
  Widget _buildReviewsList(List<Review> reviews) {
    if (reviews.isEmpty) {
      return Center(
        child: Text('No reviews to display'),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: reviews.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => ReviewCard(
        review: reviews[index],
        onReply: (review) => _showReplyDialog(review),
      ),
    );
  }

  void _showReplyDialog(Review review) {
    final TextEditingController replyController = TextEditingController();
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: isSmallScreen ? double.infinity : 600,
          padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reply to Review',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              Text('Response Templates:'),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: responseTemplates.map((template) {
                  return ActionChip(
                    label: Text('${template.substring(0, 20)}...'),
                    onPressed: () {
                      replyController.text = template;
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextField(
                controller: replyController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your response...',
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 16),
                  FilledButton(
                    onPressed: () {
                      // Implement reply logic
                      Navigator.pop(context);
                    },
                    child: Text('Send Reply'),
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

// ReviewCard widget remains the same
class ReviewCard extends StatelessWidget {
  final Review review;
  final Function(Review) onReply;

  const ReviewCard({
    required this.review,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width <= 600;

    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReviewHeader(context, isSmallScreen),
            SizedBox(height: 12),
            Text(review.review),
            if (review.response != null) ...[
              SizedBox(height: 12),
              _buildResponse(context),
            ],
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (review.response == null)
                  TextButton.icon(
                    icon: Icon(Icons.reply),
                    label: Text('Reply'),
                    onPressed: () => onReply(review),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewHeader(BuildContext context, bool isSmallScreen) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(review.customerName[0]),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.customerName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (isSmallScreen) SizedBox(height: 4),
              Wrap(
                spacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 16,
                        color: index < review.rating 
                            ? Colors.amber 
                            : Colors.grey[300],
                      ),
                    ),
                  ),
                  Text(
                    review.platform,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(' • '),
                  Text(
                    '${review.date.day}/${review.date.month}/${review.date.year}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Show more options
          },
        ),
      ],
    );
  }

  Widget _buildResponse(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Response:',
            style:TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(review.response!),
        ],
      ),
    );
  }
}