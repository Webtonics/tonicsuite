// // ignore_for_file: use_build_context_synchronously

// import 'package:flashking/authentication/auth.dart';
// import 'package:flashking/authentication/services/authservice.dart';
// import 'package:flashking/authentication/util/error_dialog.dart';
// import 'package:flashking/authentication/view/auth.dart';
// import 'package:flashking/authentication/view/forgot_password.dart';
// import 'package:flashking/authentication/view/register.dart';
// // import 'package:flashking/features/emailflash/views/app/mainview.dart';
// import 'package:flutter/material.dart';

// import '../services/authexeptions.dart';

// // Example usage for a login screen
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AuthScreen(
//       title: 'Login into your account',
//       form: Padding(
//         padding: EdgeInsets.symmetric(vertical: 80),
//         child: Column(
//           children: [
//             Text("Login into Your account"),
//             SizedBox(height: 20,),
//             Center(child: LoginForm()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {

//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   bool _obscurePassword = true;
  
//   bool _isLoading = false;

//   Future<void> _login() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     // Attempt to sign in the user
//     await AuthService().signin(_emailController.text, _passwordController.text);

//     // If sign-in is successful, navigate to the AuthViewState
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => const AuthViewState(),
//     ));
//   } on UserNotFoundAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Account Not Found",
//           content: "The details you provided cannot be found. Try again.",
//         );
//       },
//     );
//   } on InvalidEmailAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Invalid Email",
//           content: "The email address you provided is invalid. Please try again.",
//         );
//       },
//     );
//   } on WrongPasswordAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Wrong Password",
//           content: "The password you provided is not correct. Please try again.",
//         );
//       },
//     );
//   } on MissingPasswordAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Missing Password",
//           content: "The password field is missing. Please enter your password.",
//         );
//       },
//     );
//   } on InvalidCredentialAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Invalid Credential",
//           content: "The Credentials you entered are incorrect. Please try again.",
//         );
//       },
//     );
//   } 
//   on GenericAuthException {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const MyErrorDialog(
//           title: "Unexpected Error",
//           content: "An unexpected error occurred. Please try again later.",
//         );
//       },
//     );
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }


//   @override
//   void initState() {
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TextFormField( 
//             controller: _emailController,
//             decoration: const InputDecoration(
//               labelText: 'Email Address' ,
//               prefixIcon: Icon(Icons.person),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your Email Address';
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
//                 return 'Please enter your password';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
              
//                 _login();
               

                  
//               }
//             },
//              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,
//             minimumSize: const Size(double.infinity, 60)),
//             child: _isLoading?const Center(child: CircularProgressIndicator(),): const Text('Sign In',style: TextStyle(color: Colors.white),),

//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () {
//               // Navigate to forgot password screen
//               Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const ForgotPasswordScreen())),);
//             },
//             child: const Text('Forgot Password?'),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () {
//               // Navigate to login screen
//                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => const RegisterScreen())), (route) => false);
            
//             },
//             child: const Text('Don\'t have an account? Sign Up'),
//           ),
//           const SizedBox(height: 16),
          
//         ],
//       ),
//     );
//   }
// }