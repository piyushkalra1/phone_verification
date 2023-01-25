// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:phone_verification/otp_screen.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   String? uid;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'home',
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.logout,
//             ),
//             onPressed: ()async{
//               await FirebaseAuth.instance.signOut();
//               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OtpScreen()), (route) => false);
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Text(uid!),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//
//     super.initState();
//     uid = FirebaseAuth.instance.currentUser!.uid;
//   }
// }
