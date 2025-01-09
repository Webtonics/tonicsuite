// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flashking/authentication/view/login.dart';
// import 'package:flashking/authentication/view/verification.dart';
// import 'package:flashking/features/emailflash/views/app/mainview.dart';
// import 'package:flutter/material.dart';

// class AuthViewState extends StatelessWidget {
//   const AuthViewState({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         // Handle the connection state
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         // If there's an error in the stream
//         if (snapshot.hasError) {
//           return const Center(child: Text('Something went wrong!'));
//         }

//         // If the stream has data
//         if (snapshot.hasData) {
//           User? user = snapshot.data;

//           // Ensure that user data is up-to-date
//           user?.reload();

//           // Check if user is verified
//           if (user != null && user.emailVerified) {
//             return const MainAppView();
//           } else {
//             return CheckEmailScreen(email: user?.email ?? '');
//           }
//         }

//         // If no data (user not logged in)
//         return const LoginScreen();
//       },
//     );
//   }
// }
