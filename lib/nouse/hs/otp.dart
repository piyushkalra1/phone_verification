// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'home.dart';
//
// class OTPPage extends StatefulWidget {
//   final String phone;
//   OTPPage(this.phone);
//   // const OtpPage({Key? key}) : super(key: key);
//
//   @override
//   _OTPPageState createState() => _OTPPageState();
//   // State<OtpPage> createState() => _OtpPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   String? _verificationCode;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final TextEditingController _pinPutController = TextEditingController();
//   final defaultPinTheme = PinTheme(
//     width: 56,
//     height: 56,
//     textStyle: TextStyle(
//       fontSize: 20,
//       color: Color.fromARGB(30, 60, 87, 1),
//       fontWeight: FontWeight.w600,
//     ),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black),
//       borderRadius: BorderRadius.circular(20),
//     )
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'otp no',
//         )
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 40),
//             child: Center(
//               child: Text(
//                 'verrify +91-${widget.phone}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 26
//                 ),
//               ),
//             ),
//           ),
//
//
//
//           Padding(padding: EdgeInsets.all(30),
//           child: Pinput(
//             length: 6,
//             defaultPinTheme: defaultPinTheme,
//             controller: _pinPutController,
//             pinAnimationType: PinAnimationType.fade,
//
//             onSubmitted: (pin) async{
//               try{
//                 await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode !, smsCode: pin)).then((value)async{
//                   if(value.user !=null){
//                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
//                   }
//                 });
//               }catch(e){
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//               }
//             },
//           ),
//           ),
//         ],
//       ),
//     );
//   }
//   _verifyphone() async{
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+91${widget.phone}',
//         verificationCompleted: (PhoneAuthCredential credential) async{
//         await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
//           if(value.user !=null){
//             print("user logged in");
//           }
//         });
//         },
//         verificationFailed: (FirebaseAuthException e){
//         print(e.message);
//     },
//         codeSent: (String ?verificationId, int ?resendToken){
//         setState(() {
//           _verificationCode =verificationId;
//         });
//         },
//         codeAutoRetrievalTimeout: (String verificationId){
//           setState(() {
//             _verificationCode =verificationId;
//           });
//         },
//       timeout: Duration(seconds: 30));
//
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyphone();
//   }
// }
//
//
//
//
//
