// ignore_for_file: prefer_const_constructors, file_names, unused_import, avoid_print, no_logic_in_create_state, override_on_non_overriding_member, unnecessary_import, unused_local_variable, prefer_final_fields, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_element, curly_braces_in_flow_control_structures, unnecessary_null_comparison, dead_code, non_constant_identifier_names, annotate_overrides, must_call_super, unused_field, await_only_futures, unnecessary_string_interpolations


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/otp.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/main.dart';
class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);
 
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Profile1> {
   TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
 
  

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool otpVisibility = false;

  String verificationID = "";
  
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // TextEditingController phoneController = TextEditingController();
  
    
  void inputData(){
   final User? user = auth.currentUser;
   final uid = user?.uid;
    
    var userName = user?.displayName;
  }
  
    

     //FirebaseUser user = await FirebaseAuth.instance.currentUser!();
    
    
  
   
    String userName = "";
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
              
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Edit or view your information",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color:Color(0xfff7f6fb),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    
                  children: [
                    
                    //   FutureBuilder(
          //future: fetch(),
        //  builder: (context, snapshot) {
         //   if (snapshot.connectionState != ConnectionState.done)
          //    return Text("Loading data...Please wait");
           // return Text(" $userName");
           
         //},
          
       // ),
                      
                     TextFormField(
                      
                      keyboardType: TextInputType.name,
                      
                       
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      decoration: InputDecoration(
                           
                              hintText: "$userName",
                          
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
                     
                  
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );

    
  }

  fetch() async {
  final User? user = auth.currentUser;
   final uid = user?.uid;
    final firebaseUser = await user;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()!['name'];
        print(userName);
      }).catchError((e) {
        print(e);
      });
  }
}
  
  

    
  
  

 
