// // services/payment_service.dart

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/payment_model.dart';
// import '../models/payment_error_model.dart';
// import '../models/payment_config_model.dart';

// class PaymentService {
//   final String _apiUrl;
//   final PaymentConfig config;
//   final http.Client _client;

//   PaymentService({
//     required this.config,
//     String? apiUrl,
//     http.Client? client,
//   })  : _apiUrl = apiUrl ?? 'YOUR_API_ENDPOINT',
//         _client = client ?? http.Client();

//   Future<PaymentResponse> initiatePayment(PaymentRequest request) async {
//     try {
//       final response = await _client.post(
//         Uri.parse('$_apiUrl/payments/initiate'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer ${config.publicKey}',
//         },
//         body: json.encode(request.toJson()),
//       );

//       if (response.statusCode != 200) {
//         throw PaymentError(
//           code: 'payment_initiation_failed',
//           message: 'Failed to initiate payment',
//           details: response.body,
//           timestamp: DateTime.now(),
//         );
//       }

//       final responseData = json.decode(response.body);
//       return PaymentResponse.fromJson(responseData);
//     } catch (e) {
//       throw PaymentError(
//         code: 'network_error',
//         message: 'Payment initiation failed',
//         details: e.toString(),
//         timestamp: DateTime.now(),
//       );
//     }
//   }

//   Future<PaymentResponse> verifyPayment(String transactionId) async {
//     try {
//       final response = await _client.get(
//         Uri.parse('$_apiUrl/payments/verify/$transactionId'),
//         headers: {
//           'Authorization': 'Bearer ${config.publicKey}',
//         },
//       );

//       if (response.statusCode != 200) {
//         throw PaymentError(
//           code: 'verification_failed',
//           message: 'Payment verification failed',
//           details: response.body,
//           timestamp: DateTime.now(),
//         );
//       }

//       final responseData = json.decode(response.body);
//       return PaymentResponse.fromJson(responseData);
//     } catch (e) {
//       throw PaymentError(
//         code: 'network_error',
//         message: 'Payment verification failed',
//         details: e.toString(),
//         timestamp: DateTime.now(),
//       );
//     }
//   }

//   Future<void> handleWebhook(Map<String, dynamic> webhookData) async {
//     // Implement webhook handling logic
//     // This will be called by your backend when it receives Flutterwave webhooks
//   }
// }

