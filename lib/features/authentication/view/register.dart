// // ignore_for_file: use_build_context_synchronously

// import 'package:flashking/authentication/auth.dart';
// import 'package:flashking/authentication/services/authservice.dart';
// import 'package:flashking/authentication/view/auth.dart';
// import 'package:flashking/authentication/view/login.dart';
// import 'package:flutter/material.dart';

// import '../services/authexeptions.dart';
// import '../util/error_dialog.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  const AuthScreen(title: "Register An Account Today", 
//     form:Padding(
//        padding: EdgeInsets.symmetric(vertical: 40),
//       child: Column(
//         children: [
//           Text("Register a new Account", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,),),
//           SizedBox(height: 40,),
//           Center(child: RegistrationForm())
//         ],
//       ),
//     ));
//   }
// }



// class RegistrationForm extends StatefulWidget {
//   const RegistrationForm({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _RegistrationFormState createState() => _RegistrationFormState();
// }

// class _RegistrationFormState extends State<RegistrationForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool _obscurePassword = true;
//   String _passwordStrength = 'Weak';

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
  
//   bool _isloading = false;

//   Future _signup(BuildContext context) async {
//     String res = "an error occured";

//     setState(() {
//       _isloading = true;
//     });

//     try {
//       await AuthService().signup(_usernameController.text, _emailController.text, _passwordController.text, context);
//       // res = "Success";
//     // ignore: duplicate_ignore
//     } on EmailAlreadyinUseAuthException {
      
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const MyErrorDialog(
//               title: " Email Already in Use",
//               content:
//                   "The Email address you provided is associated with another account.",
//             );
//           });
//     } on InvalidEmailAuthException {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const MyErrorDialog(
//               title: "Invalid Email",
//               content:
//                   "The Email address you provided is invalid. Try again with a correct email. Please try again",
//             );
//           });
//     } on MissingPasswordAuthException {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const MyErrorDialog(
//               title: " Missing Password",
//               content: "The Password Field is missing please check again.",
//             );
//           });
//     } on WeakPasswordAuthException {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const MyErrorDialog(
//               title: " Weak Password",
//               content:
//                   "The Password you provided is not Secure try a combination of 8 (Letters/symbols/numbers). Please try again",
//             );
//           });
//     } on GenericAuthException {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const MyErrorDialog(
//               title: " Unexpected Error",
//               content:
//                   "This is an Unexpected error. Please restart the app or contact us in our handle",
//             );
//           });
//     }

//     if (res == "Success") {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Verification email sent. Please check your inbox.')));
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const AuthViewState()));
//     }
//     setState(() {
//       _isloading = false;
//     });
//     // print(res);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TextFormField(
//             controller: _usernameController,
//             decoration: const InputDecoration(
//               labelText: 'Username',
//               prefixIcon: Icon(Icons.person),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 16),
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
//           const SizedBox(height: 16),
//           TextFormField(
//             controller: _passwordController,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               prefixIcon: const Icon(Icons.lock),
//               suffixIcon: IconButton(
//                 icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
//                 onPressed: () {
//                   setState(() {
//                     _obscurePassword = !_obscurePassword;
//                   });
//                 },
//               ),
//             ),
//             obscureText: _obscurePassword,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a password';
//               }
//               if (value.length < 8) {
//                 return 'Password must be at least 8 characters long';
//               }
//               return null;
//             },
//             onChanged: (value) {
//               setState(() {
//                 if (value.length < 6) {
//                   _passwordStrength = 'Weak';
//                 } else if (value.length < 10) {
//                   _passwordStrength = 'Medium';
//                 } else {
//                   _passwordStrength = 'Strong';
//                 }
//               });
//             },
//           ),
//           const SizedBox(height: 8),
//           Text('Password strength: $_passwordStrength',
//               style: TextStyle(color: _getPasswordStrengthColor())),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 // Perform registration
//                 _signup(context);
//                 Future.delayed(const Duration(seconds: 2), () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: ((context) => const AuthViewState())),
//                 );
//               });
                
//               }
//             },
//             child: const Text('Sign Up'),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () {
//               // Navigate to login screen
//                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => const LoginScreen())), (route) => false);
            
//             },
//             child: _isloading? const Center(child: CircularProgressIndicator()): const Text('Already have an account? Sign In'),
//           ),
//           const SizedBox(height: 16),
//           // OutlinedButton.icon(
//           //   onPressed: () {
//           //     // Implement Google Sign Up
//           //   },
//           //   icon: const Icon(Icons.g_mobiledata),
//           //   label: const Text('Sign Up with Google'),
//           // ),
//         ],
//       ),
//     );
//   }

//   Color _getPasswordStrengthColor() {
//     switch (_passwordStrength) {
//       case 'Weak':
//         return Colors.red;
//       case 'Medium':
//         return Colors.orange;
//       case 'Strong':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
// }