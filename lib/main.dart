

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/house.dart';
import 'package:phone_verification/nouse/toptextbutton.dart';
import 'package:phone_verification/otpnow.dart';
import 'package:phone_verification/phone.dart';
import 'package:phone_verification/splash_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center( child: CircularProgressIndicator(color: Colors.blue,),);
          }
          else if(snapshot.hasData){
            return House();
          }else{
            return MyPhone();
          }
        },
      ),
    )
  //     MaterialApp(
  //
  //   debugShowCheckedModeBanner: false,
  //   initialRoute: 'phone',
  //   routes: {
  //     'phone' : (context) =>MyPhone(),
  //     'otp' : (context) =>MyOtp(),
  //     'house': (context) =>House(),
  //
  //   },
  //
  // )
  );
}
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GoogleAuthentication (),
//     );
//   }
// }

