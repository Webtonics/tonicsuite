// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flashking/authentication/models/user_model.dart' as model;
// import 'package:flashking/authentication/provider/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'authexeptions.dart';

// class AuthService {
//   final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


//   //Create User
  
//   Future<String> signup(String displayName, String email,
//       String password, BuildContext context ) async {
//     String res = "An Error Occured";

//     try {
//       UserCredential cred = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);

     
//       model.User userinfo = model.User(
//           username: displayName,
//           email: email,
//           id: cred.user!.uid,
//           isSubscribed: false, 
//           subscriptionStatus: 'inactive', 
//           subscriptionStartDate: null, 
//           subscriptionEndDate: null,
//           );

//       //adding to db
//       await _firebaseFirestore
//           .collection("users")
//           .doc(cred.user!.uid)
//           .set(userinfo.toMap());
//       res = "Successful";
//       sendEmailVerification();

//       // ignore: use_build_context_synchronously
//       context.read<UserProvider>().setUser(userinfo);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         throw WeakPasswordAuthException();
//       } else if (e.code == 'email-already-in-use') {
//         throw EmailAlreadyinUseAuthException();
//       } else if (e.code == 'invalid-email') {
//         throw InvalidEmailAuthException();
//       } else if (e.code == "missing-password") {
//         throw MissingPasswordAuthException();
//       } else {
//         throw GenericAuthException();
//       }
//     } catch (_) { 
//       throw GenericAuthException();
//     }
//     return res;
//   }

//   //login user
//   Future<String> signin(String email, String password) async {
//     String res = ' An error occured';
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       res = "Success";
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-login-credentials') {
//         throw UserNotFoundAuthException();
//       } else if (e.code == 'invalid-email') {
//         throw InvalidEmailAuthException();
//       } else if (e.code == 'user-not-found') {
//         throw UserNotFoundAuthException();
//       } else if (e.code == 'wrong-password') {
//         throw WrongPasswordAuthException();
//       } else if (e.code == 'missing-password') {
//         throw MissingPasswordAuthException();
//       } else if(e.code == 'invalid-credential'){
//         throw InvalidCredentialAuthException();
//       }else {
//         // print(e.code);
//         throw GenericAuthException();
//       }
//     } catch (e) {
//       throw GenericAuthException();
//     }

//     return res;
//   }

//   // Future<model.User> getUserDetails() async {
//   //   User currentUser = _auth.currentUser!;
//   //   DocumentSnapshot documentSnapshot =
//   //       await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
//   //   return model.User.fromJson(documentSnapshot as String);
//   // }

//   Future<model.User> getUserDetails() async {
//     User currentUser = _auth.currentUser!;
//     DocumentSnapshot documentSnapshot =
//         await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

//     if (documentSnapshot.exists) {
//       return model.User.fromMap(documentSnapshot.data() as Map<String, dynamic>);
//     } else {
//       throw Exception('User not found');
//     }
//   }



//   Future<void> updateUserInfo(String email, String username) async {
//     User user = _auth.currentUser!;

//     try {
//       await _firebaseFirestore
//           .collection("users")
//           .doc(user.uid)
//           .update({'email': email, 'displayName': username});
//     } catch (e) {
//       // print(e.toString());
//     }
//   }

//   signout() {
//     _auth.signOut();
//   }

//   Future<void> sendEmailVerification() async {
//     await _auth.currentUser!.sendEmailVerification();
//   }

 
//   Future<void> forgotPassword(String email) async {
//     await _auth.sendPasswordResetEmail(email: email);
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-email') {
//         throw InvalidEmailAuthException();
//       } else if (e.code == 'missing-email') {
//         throw MissingEmailAuthException();
//       } else {
//         throw GenericAuthException();
//       }
//     }
//   }
  
// }