// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_is_empty



import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({ Key? key }) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
                "Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Enter the verification code sent to your phone number",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 14,
                   color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 38,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Color(0xfff7f6fb),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     _textFieldOTP(first: true, last: false),
                     _textFieldOTP(first: false, last: false),
                     _textFieldOTP(first: false, last: false),
                     _textFieldOTP(first: false, last: true),
                      ],
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
                        builder: (context) =>Otp(),
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
                      'Verify',
                       style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
                  
                   
                  ],
                ),
              ),
               
              SizedBox(
                height: 18,
              ),
              Text(
                "I didn't receive the code",
                style: TextStyle(
                   fontSize: 18, 
                   fontWeight: FontWeight.bold, 
                   color: Colors.grey,
                ),
              ),
              
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend New Code", 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _textFieldOTP({bool? first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value){
            if(value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 0 && first == false){
              FocusScope.of(context).previousFocus();

            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 24), 
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color:  Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color:  Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
          ),    
        ),
      ),
    );
  }
}

 