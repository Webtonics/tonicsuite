// // ignore_for_file: library_private_types_in_public_api

// import 'dart:async';

// import 'package:flashking/authentication/services/authservice.dart';
// import 'package:flashking/authentication/view/auth.dart';
// import 'package:flashking/authentication/view/login.dart';
// import 'package:flutter/material.dart';



// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  AuthScreen(
//       title: "Forgot Your Password?",
//       form: Padding(
//         padding: const EdgeInsets.only(top: 40),
//         child: Column(
//           children: [
//            Visibility(
//             visible: MediaQuery.of(context).size.width>500,
//             child:  const Text("Recover your Password")),
      
//             const ForgotPasswordForm()
//           ],
//         ),
//       ),
//     );
//   }
// }
// class ForgotPasswordForm extends StatefulWidget {
//   const ForgotPasswordForm({super.key});

//   @override
//   _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
// }

// class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   bool _isButtonEnabled = true;
//   int _countdown = 0;
//   Timer? _timer;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startCountdown() {
//     const countdownDuration = 30; // Set the countdown duration (e.g., 30 seconds)
//     setState(() {
//       _countdown = countdownDuration;
//       _isButtonEnabled = false;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_countdown > 0) {
//           _countdown--;
//         } else {
//           _isButtonEnabled = true;
//           _timer?.cancel();
//         }
//       });
//     });
//   }

//   void _showDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Password Reset'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void>_sendPasswordEmail()async{
//     await AuthService().forgotPassword(_emailController.text);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const SizedBox(height: 16),
//           const Text(
//             'Enter your email address and we\'ll send you instructions to reset your password.',
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 24),
//           TextFormField(
//             controller: _emailController,
//             decoration: const InputDecoration(
//               labelText: 'Email Address',
//               prefixIcon: Icon(Icons.email),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                 return 'Please enter a valid email';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: _isButtonEnabled
//                 ? () {
//                     if (_formKey.currentState!.validate()) {
//                       // Call the function to send the password reset email
//                       _startCountdown();
//                       _sendPasswordEmail();
//                       _showDialog(
//                           'We\'ve sent you an email with instructions to reset your password. Please check your inbox or spam folder.');
//                     }
//                   }
//                 : null,
//             child: Text(
//               _isButtonEnabled ? 'Reset Password' : 'Try again in $_countdown s',
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                     builder: ((context) => const LoginScreen())),
//               );
//             },
//             child: const Text('Back to Login'),
//           ),
//         ],
//       ),
//     );
//   }
// }
