// // models/payment_model.dart

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'payment_model.freezed.dart';
// part 'payment_model.g.dart';

// enum PaymentStatus {
//   initial,
//   processing,
//   success,
//   failed,
//   cancelled
// }

// @freezed
// class PaymentRequest with _$PaymentRequest {
//   const factory PaymentRequest({
//     required String email,
//     required double amount,
//     required String currency,
//     required String customerName,
//     String? phoneNumber,
//     String? description,
//     Map<String, dynamic>? metadata,
//   }) = _PaymentRequest;

//   factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
//       _$PaymentRequestFromJson(json);
// }

// @freezed
// class PaymentResponse with _$PaymentResponse {
//   const factory PaymentResponse({
//     required String transactionId,
//     required PaymentStatus status,
//     required double amount,
//     required String currency,
//     required DateTime timestamp,
//     String? paymentMethod,
//     String? failureMessage,
//     Map<String, dynamic>? metadata,
//   }) = _PaymentResponse;

//   factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
//       _$PaymentResponseFromJson(json);
// }

// // models/transaction_model.dart

// @freezed
// class Transaction with _$Transaction {
//   const factory Transaction({
//     required String id,
//     required String userId,
//     required PaymentStatus status,
//     required String transactionId,
//     required double amount,
//     required String currency,
//     required DateTime createdAt,
//     String? customerName,
//     String? email,
//     String? phoneNumber,
//     String? paymentMethod,
//     String? failureReason,
//     Map<String, dynamic>? metadata,
//   }) = _Transaction;

//   factory Transaction.fromJson(Map<String, dynamic> json) =>
//       _$TransactionFromJson(json);
// }

// // models/payment_config_model.dart

// @freezed
// class PaymentConfig with _$PaymentConfig {
//   const factory PaymentConfig({
//     required String publicKey,
//     required String merchantId,
//     required List<String> supportedCurrencies,
//     required Map<String, bool> enabledPaymentMethods,
//     String? logoUrl,
//     String? companyName,
//     Map<String, dynamic>? customization,
//   }) = _PaymentConfig;

//   factory PaymentConfig.fromJson(Map<String, dynamic> json) =>
//       _$PaymentConfigFromJson(json);
// }

// // models/payment_error_model.dart

// @freezed
// class PaymentError with _$PaymentError {
//   const factory PaymentError({
//     required String code,
//     required String message,
//     String? details,
//     DateTime? timestamp,
//   }) = _PaymentError;

//   factory PaymentError.fromJson(Map<String, dynamic> json) =>
//       _$PaymentErrorFromJson(json);
// }