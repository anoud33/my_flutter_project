// ignore_for_file: prefer_const_constructors, unused_import



import 'package:flutter/material.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/main.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
              Image.asset(
                'images/Ask-the-midwife-logo.png',
               width:240,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Wherever you are",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Keep track of your baby's health",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
              ),
              SizedBox(
                height: 38,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>Signup(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: 
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Register',
                       style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>Register(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: 
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Login',
                       style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}