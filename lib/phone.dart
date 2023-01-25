import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:phone_verification/house.dart';
import 'package:phone_verification/otpnow.dart';
import 'package:phone_verification/services/firebase_services.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {

  final selectedIndexNotifier = ValueNotifier<int?>(1);


  TextEditingController countryCode = TextEditingController();
  var phone ="";
  @override
  void initState() {
    countryCode.text ='+91';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25,right: 25),
            alignment: Alignment.center,

              child:
          SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [


              Container(

                decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [

                    SizedBox(width: 10,),
                    // Container(height: 30,width: 20,child: Image(image: AssetImage('images/flag.jpg'))),
                    SizedBox(width: 45,child: TextField(
                      controller: countryCode,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                      ),
                    ),),
                    Text('|'),
                    SizedBox(width: 10,),
                    Expanded(child: TextField(
                      onChanged: (value){
                        phone=value;
                      },
                      keyboardType: TextInputType.phone,

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'phone'
                    ),

                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            SizedBox(height: 45,width: double.infinity,
              child: ElevatedButton(
                onPressed: ()async{
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '${countryCode.text +phone}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    MyPhone.verify=verificationId;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOtp()));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );

              }, child: Text('Send OTp'),style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(20),
                  ),
              ),),
            ),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: 60,width: 140,
                   child: Divider(color: Colors.black,),),
                 Text('OR'),
                 SizedBox(height: 60,width: 140,
                   child: Divider(color: Colors.black,),),
               ],
             ),
              Reuse(tittle: "Connect with facebook",colour1: Colors.white,thubnail: Image(image: AssetImage('images/fb.png')),),
              SizedBox(height: 14,),
              InkWell(
                onTap: ()async{
                  print('object');
                  await FirebaseServices().signInWithGoogle();
                  print('hii');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>House()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                  ),
                  child:Row(
                    children: [
                      Container(height: 30,width: 40,child:Image(image: AssetImage('images/google.jpg')),),
                      Text('By google',style: TextStyle(color: Colors.black),),
                    ],
                  ) ,
                ),
              ),

              SizedBox(height: 60,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By joining Guruji,you agree to our\n terms of service"),
                ],
              )





            ],
          ),)),
        ],
      ),
    );
  }
}

class Reuse extends StatelessWidget {
  final String tittle;
  final Widget thubnail;
  final Color colour1;
  Reuse({required this.tittle, required this.colour1,required this.thubnail});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 45,width: double.infinity,
      child: ElevatedButton(onPressed: (){
      }, child: Row(
        children: [
          Container(height: 30,width: 40,child:thubnail),
          Text(tittle,style: TextStyle(color: Colors.black),),
        ],
      ),style: ElevatedButton.styleFrom(
        primary: colour1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),),
    );
  }
}
