// ignore_for_file: override_on_non_overriding_member, deprecated_member_use, prefer_const_constructors, curly_braces_in_flow_control_structures, unused_local_variable, unused_import, use_key_in_widget_constructors, avoid_print, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/signup.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String myEmail="";
    var fsconnect = FirebaseFirestore.instance;
    
      final FirebaseAuth auth = FirebaseAuth.instance;
 
  

  FirebaseFirestore firestore = FirebaseFirestore.instance;
 
  @override
  
     
    Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Text("Email : $myEmail");
          },
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
        myEmail = ds.data()!['name'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }
}
