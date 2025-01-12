// // services/payment_manager.dart

// import 'package:tonic_suite/features/payment_module/services/firebase_service.dart';
// import 'package:tonic_suite/features/payment_module/services/payment_service.dart';

// class PaymentManager {
//   final FirebaseService _firebaseService;
//   final PaymentService _paymentService;

//   PaymentManager({
//     required FirebaseService firebaseService,
//     required PaymentService paymentService,
//   })  : _firebaseService = firebaseService,
//         _paymentService = paymentService;

//   Future<PaymentResponse> processPayment(PaymentRequest request) async {
//     // Create initial transaction record
//     final transaction = Transaction(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       userId: _firebaseService.currentUserId!,
//       status: PaymentStatus.processing,
//       transactionId: '',  // Will be updated after payment initiation
//       amount: request.amount,
//       currency: request.currency,
//       createdAt: DateTime.now(),
//       customerName: request.customerName,
//       email: request.email,
//       phoneNumber: request.phoneNumber,
//       metadata: request.metadata,
//     );

//     await _firebaseService.saveTransaction(transaction);

//     try {
//       // Initiate payment
//       final paymentResponse = await _paymentService.initiatePayment(request);

//       // Update transaction with payment details
//       await _firebaseService.updateTransactionStatus(
//         transaction.id,
//         paymentResponse.status,
//       );

//       return paymentResponse;
//     } catch (e) {
//       // Handle payment failure
//       await _firebaseService.updateTransactionStatus(
//         transaction.id,
//         PaymentStatus.failed,
//         failureReason: e.toString(),
//       );
//       rethrow;
//     }
//   }

//   Future<PaymentResponse> verifyAndUpdatePayment(String transactionId) async {
//     try {
//       final paymentResponse = await _paymentService.verifyPayment(transactionId);
      
//       await _firebaseService.updateTransactionStatus(
//         transactionId,
//         paymentResponse.status,
//       );

//       return paymentResponse;
//     } catch (e) {
//       await _firebaseService.updateTransactionStatus(
//         transactionId,
//         PaymentStatus.failed,
//         failureReason: e.toString(),
//       );
//       rethrow;
//     }
//   }

//   Stream<List<Transaction>> getTransactionHistory() {
//     return _firebaseService.getUserTransactions();
//   }
// }