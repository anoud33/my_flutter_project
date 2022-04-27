// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, avoid_print, unused_import, prefer_final_fields, unnecessary_import, unnecessary_null_comparison, await_only_futures, non_constant_identifier_names, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/otp.dart';
import 'package:flutter_application_1/profile1.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
 
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Signup> {
   TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData(){
   final User? user = auth.currentUser;
   final uid = user?.uid;
  }
  

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool otpVisibility = false;

  String verificationID = "";
  var _FName = TextEditingController();
  
  CollectionReference users = FirebaseFirestore.instance.collection('users');
 

 
  @override
  Widget build(BuildContext context) {
      return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb) ,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap:() {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 35,
                      
                    ),
                  ),
                ),
              
                Image.asset(
                  'images/Ask-the-midwife-logo.png',
                 width:240,
                ),
              
              SizedBox(
                height: 18,
              ),
              Text(
                "Registration",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Text("Enter your information",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color:Color(0xfff7f6fb),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // field to enter name
                      TextFormField(
                      
                      keyboardType: TextInputType.name,
                      controller: _FName,
                       //
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                     
                      ),
                    ),
                    SizedBox(height: 10,),
                    
                  
                    SizedBox(height: 10,),
                    //field to enter phone number
                    TextFormField(
                      
                      keyboardType: TextInputType.number,
                      controller: phoneController, //
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      decoration: InputDecoration(
                        hintText: ' Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '(+966)',
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                           ),
                      ), 
                      suffixIcon: Icon(
                        Icons.check_circle,
                         color: Colors.green, 
                         size: 32, 
                         ),
                      ),
                    ),
                    //we used visibility in case number is written only signup button will appear if signup button pressed then otp filed is shown and verify button will show
                    Visibility(
                      child: TextField(

                        controller: otpController,
                        decoration: InputDecoration(
                          hintText: 'OTP',
                          prefix: Padding(

                            padding: EdgeInsets.all(4),
                            child: Text(''),
                          ),
                        ),
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                     ),
                     visible: otpVisibility,
                    ),
                    
                    SizedBox(

                      height: 18,
                    ),
                   
                    MaterialButton(
                      
                      color: Colors.blue,
                      
                      onPressed: () {
                        if (otpVisibility) {
                          
                          verifyOTP();
                         // checkForFirstTime(userid);
                          //
                        } else {
                           loginWithPhone();
                          }
                      },
                      
                      //verify will appear or register depending
                      child: Text(

                        otpVisibility ? "Verify" : "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        
                        
                      ),
                      
                    ),
                    
                    
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
  //check number is true
   void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+966" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
// check if otp is correct you will register and information will be stored in firebase
  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
    
    await auth.signInWithCredential(credential).then(
      (value) async {
        
        User? user = FirebaseAuth.instance.currentUser;
        
        
          await FirebaseFirestore.instance.collection('userinfo').doc(user?.uid).set({
          'uid': user?.uid,
          'name':_FName.text, 
           
         
          });
          storeNewUser(auth.currentUser);
          FirebaseAuth.instance.currentUser!.updateProfile(displayName:_FName.text);
        print("You are logged in successfully");
        
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
            Fluttertoast.showToast(
          msg: "User added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Profile1(),
          ),
        );
        
        
      },
    );
  }
  // set info in firebase
     storeNewUser(user) async {
     final User? user = auth.currentUser;
   final uid = user?.uid;
    var firebaseUser = await user;
    FirebaseFirestore.instance
        .collection('userinfo')
        .doc(firebaseUser?.uid)
        .set({'uid': user?.uid,'name': user?.displayName})
        .then((value) {})
        .catchError((e) {
          print(e);
        });
  }
}
 