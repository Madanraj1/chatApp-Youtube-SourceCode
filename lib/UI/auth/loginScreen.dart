import 'package:chatapp/chats/ChatScreen.dart';
import 'package:chatapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool otpSent = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height * 0.3,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 2)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              otpSent
                  ? PinCodeTextField(
                      onDone: (value) {
                        print(value);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      pinBoxColor: Colors.white,
                      pinBoxWidth: size.width * 0.1,
                      pinBoxHeight: size.height * 0.06,
                      defaultBorderColor: Colors.white,
                      pinTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        shadows: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                          )
                        ],
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                          ),
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          labelText: "Phone Number",
                          prefix: Text("+91"),
                        ),
                      ),
                    ),
              !otpSent
                  // ignore: deprecated_member_use
                  ? FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color(0xffF9991A),
                      onPressed: () {
                        setState(() {
                          otpSent = true;
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  // ignore: deprecated_member_use
                  : FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color(0xffF9991A),
                      onPressed: () {
                        phoneController.clear();
                        setState(() {
                          otpSent = false;
                        });
                      },
                      child: Text(
                        "Try Again",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
