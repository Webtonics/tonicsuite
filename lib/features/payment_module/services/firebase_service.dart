// // services/firebase_service.dart

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../models/transaction_model.dart';
// import '../models/payment_error_model.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Collection references
//   CollectionReference get _transactions => 
//       _firestore.collection('transactions');

//   // Get current user ID
//   String? get currentUserId => _auth.currentUser?.uid;

//   // Save new transaction
//   Future<void> saveTransaction(Transaction transaction) async {
//     try {
//       await _transactions.doc(transaction.id).set(transaction.toJson());
//     } catch (e) {
//       throw PaymentError(
//         code: 'firebase_error',
//         message: 'Failed to save transaction',
//         details: e.toString(),
//         timestamp: DateTime.now(),
//       );
//     }
//   }

//   // Update transaction status
//   Future<void> updateTransactionStatus(
//     String transactionId, 
//     PaymentStatus status,
//     {String? failureReason}
//   ) async {
//     try {
//       await _transactions.doc(transactionId).update({
//         'status': status.toString(),
//         if (failureReason != null) 'failureReason': failureReason,
//         'updatedAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       throw PaymentError(
//         code: 'firebase_error',
//         message: 'Failed to update transaction',
//         details: e.toString(),
//         timestamp: DateTime.now(),
//       );
//     }
//   }

//   // Get user's transactions
//   Stream<List<Transaction>> getUserTransactions() {
//     if (currentUserId == null) {
//       throw PaymentError(
//         code: 'auth_error',
//         message: 'User not authenticated',
//         timestamp: DateTime.now(),
//       );
//     }

//     return _transactions
//         .where('userId', isEqualTo: currentUserId)
//         .orderBy('createdAt', descending: true)
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//             .map((doc) => Transaction.fromJson(doc.data() as Map<String, dynamic>))
//             .toList());
//   }

//   // Get single transaction
//   Future<Transaction> getTransaction(String transactionId) async {
//     try {
//       final doc = await _transactions.doc(transactionId).get();
//       if (!doc.exists) {
//         throw PaymentError(
//           code: 'not_found',
//           message: 'Transaction not found',
//           timestamp: DateTime.now(),
//         );
//       }
//       return Transaction.fromJson(doc.data() as Map<String, dynamic>);
//     } catch (e) {
//       throw PaymentError(
//         code: 'firebase_error',
//         message: 'Failed to fetch transaction',
//         details: e.toString(),
//         timestamp: DateTime.now(),
//       );
//     }
//   }
// }

