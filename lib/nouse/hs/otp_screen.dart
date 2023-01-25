// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:phone_verification/otp.dart';
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   TextEditingController _controller =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             "phone auth",
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//         ),),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(top: 60),
//             child: Text(
//
//               "phone auth",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
//             child:TextField(
//               decoration: InputDecoration(
//                 hintText: 'phone number',
//                 prefix: Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Text(
//                     "+91",
//                   ),
//                 )
//               ),
//               keyboardAppearance: Brightness.dark,
//               keyboardType: TextInputType.number,
//               maxLength: 10,
//               controller: _controller,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(10),
//             width: double.infinity,
//             child: FlatButton(
//               color: Colors.blue,
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>OTPPage(_controller.text)));
//               },
//               child: Text(
//                 "next",
//               ),
//             ),
//           )
//         ],
//       ),
//
//     );
//   }
// }
