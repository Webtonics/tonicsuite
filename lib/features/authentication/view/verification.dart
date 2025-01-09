// import 'package:flashking/authentication/services/authservice.dart';
// import 'package:flashking/authentication/view/auth.dart';
// import 'package:flashking/authentication/view/login.dart';
// import 'package:flutter/material.dart';

// class CheckEmailScreen extends StatelessWidget {
//   final String email;

//   const CheckEmailScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  AuthScreen(title: 'Email Verification', form: EmailVerificationForm( email: email,));
//   }
// }

// class EmailVerificationForm extends StatefulWidget {
//   const EmailVerificationForm({super.key, required this.email});
//     final String email;
//   @override
//   State<EmailVerificationForm> createState() => _EmailVerificationFormState();
// }

// class _EmailVerificationFormState extends State<EmailVerificationForm> {
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 30),
//             Icon(
//               Icons.email_outlined,
//               color: Theme.of(context).primaryColor,
//               size: 100,
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               'Check your inbox',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'We have sent a verification link to:',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               widget.email,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Please check your inbox or spam folder to verify your email address.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () async{
//                 // You can add your resend logic here
//                await AuthService().sendEmailVerification();
//               },
//               child: const Text('Resend Verification Email'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: ((context) => const LoginScreen())), );
//               },
//               child: const Text('Back to Login'),
//             ),
//           ],
//         ),
//       );
//   }
// }
