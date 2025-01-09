// import 'package:flashking/constants/colors.dart';
// import 'package:flutter/material.dart';

// class AuthScreen extends StatelessWidget {
//   final String title;
//   final Widget form;

//   const AuthScreen({Key? key, required this.title, required this.form}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainScaffoldCOlor,
//       body: LayoutBuilder(
      
//         builder: (context, constraints) {
//           if (constraints.maxWidth > 600) {
//             return _buildWideLayout(context);
//           } else {
//             return _buildNarrowLayout(context);
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildWideLayout(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             // color: Color.fromARGB(255, 36, 15, 15),
            
//             decoration: const BoxDecoration(
//               color: mainScaffoldCOlor,
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 opacity: 0.7,
//                 image: NetworkImage(
                
//                 "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 40,),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   // ignore: avoid_unnecessary_containers
//                   child: Container(child: const Image(image: AssetImage('assets/logo_walet.png')),),

//                 ),
//                 //image here
//                 const SizedBox(height: 50,),
                
//               ],
//             ),
//           ),
//         ),
//         Expanded(
        
//           child: Center(
//             child: Container(
//               color: mainScaffoldCOlor,
//               constraints: const BoxConstraints(maxWidth: 400),
//               padding: const EdgeInsets.all(24),
//               child: form,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildNarrowLayout(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 48),
//             // ignore: avoid_unnecessary_containers
//             Container(child: const Image(image: AssetImage('assets/logo_walet.png')),),
//             // Text(
//             //   title,
//             //   style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//             //   textAlign: TextAlign.center,
//             // ),
//             const SizedBox(height: 20),
//             form,
//           ],
//         ),
//       ),
//     );
//   }
// }