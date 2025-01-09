

// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Import this for Timestamp

// class User {
//   final String id;
//   final String username;
//   final String email;
//   final String subscriptionStatus;
//   final DateTime? subscriptionStartDate;
//   final DateTime? subscriptionEndDate;
//   final bool isSubscribed;

//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.isSubscribed,
//     required this.subscriptionStatus,
//     this.subscriptionStartDate,
//     this.subscriptionEndDate,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'username': username,
//       'email': email,
//       'isSubscribed': isSubscribed,
//       'subscriptionStatus': subscriptionStatus,
//       'subscriptionStartDate': subscriptionStartDate,
//       'subscriptionEndDate': subscriptionEndDate,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'] ?? '',
//       username: map['username'] ?? '',
//       email: map['email'] ?? '',
//       isSubscribed: map['isSubscribed'] ?? false,
//       subscriptionStatus: map['subscriptionStatus'] ?? 'inactive',
//       subscriptionStartDate: map['subscriptionStartDate'] != null
//           ? (map['subscriptionStartDate'] as Timestamp).toDate()
//           : null,
//       subscriptionEndDate: map['subscriptionEndDate'] != null
//           ? (map['subscriptionEndDate'] as Timestamp).toDate()
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }
