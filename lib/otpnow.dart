import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/house.dart';
import 'package:phone_verification/phone.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int start =30;
  var phone ="";
  bool wait= false;
  String buttonname= 'resend';

  // @override
  // void initState() {
  //   startTimer();
  //   wait?null:startTimer();
  //   setState(() {
  //     wait=true;
  //     start=30;
  //   });
  //
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code="";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 25,right: 25),
          alignment: Alignment.center,

          child:
          SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ENter otp'),
              Text(' A Six DIGIT CODE your phone no $phone',textAlign: TextAlign.center,),

              SizedBox(height: 40,),

              

              SizedBox(height: 30,),
            Pinput(
              length: 6,

              showCursor: true,
              onChanged: (value){
                code=value;
              },
            ),
              SizedBox(height: 30,),

              SizedBox(height: 45,width: double.infinity,
                child: ElevatedButton(onPressed: ()async{
                  // final SharedPreferences sharedPreferences = await SharedPreferences as SharedPreferences;
                  // sharedPreferences.setString('phone',phone);
                  try{
                    PhoneAuthCredential credential =
                    PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);

                    await auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>House()));
                  }catch(e){
                    print('wrong otp');
                  }


                  // Navigator.pushNamed(context, 'otp');
                }, child:
                // wait? Text(buttonname):
                Text('Done'),style: ElevatedButton.styleFrom(

                    primary:wait?Colors.lime: Colors.lightGreen.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),),
              ),

              SizedBox(height: 30,),
               Column(
                children: [
                  Text("Don't you have recieve any code?"),
                  // TextButton(onPressed: (){
                  //   Navigator.pop(context);
                  // }, child: Text('Resend code,$start sec')),

                ],
              ),

            ],
          ),)),
    );

  }
  // void startTimer(){
  //   const onsec = Duration(seconds: 1);
  //   Timer timer = Timer.periodic(onsec, (timer) {
  //     if(start==0){
  //       setState(() {
  //         timer.cancel();
  //         wait=false;
  //       });
  //     }else
  //       setState(() {
  //         start--;
  //       });
  //
  //   });
  // }
}
