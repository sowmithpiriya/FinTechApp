import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final phoneController =
  TextEditingController();

  final otpController =
  TextEditingController();

  String verificationId = "";

  bool otpVisible = false;

  Future<void> sendOTP() async {

    await FirebaseAuth.instance.verifyPhoneNumber(

      phoneNumber:
      "+91${phoneController.text}",

      verificationCompleted:
          (PhoneAuthCredential credential) {},

      verificationFailed:
          (FirebaseAuthException e) {

        ScaffoldMessenger.of(context)
            .showSnackBar(

          SnackBar(
            content: Text(e.message ?? ""),
          ),
        );
      },

      codeSent:
          (String verId, int? resendToken) {

        verificationId = verId;

        setState(() {
          otpVisible = true;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(
            content:
            Text("OTP Sent"),
          ),
        );
      },

      codeAutoRetrievalTimeout:
          (String verId) {},
    );
  }

  Future<void> verifyOTP() async {

    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(

      verificationId: verificationId,

      smsCode: otpController.text,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential);

    if (!mounted) return;

    Navigator.pushReplacement(

      context,

      MaterialPageRoute(
        builder: (_) =>
        const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xff5F259F),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 40,
                ),

                child: const Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "FinPay",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 30),

                    Text(
                      "India's Trusted\nPayments App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(25),

                decoration:
                const BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.only(
                    topLeft:
                    Radius.circular(35),
                    topRight:
                    Radius.circular(35),
                  ),
                ),

                child: Column(

                  children: [

                    TextField(

                      controller:
                      phoneController,

                      keyboardType:
                      TextInputType.phone,

                      decoration:
                      InputDecoration(

                        hintText:
                        "Phone Number",

                        filled: true,

                        fillColor:
                        Colors.grey.shade100,

                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                              15),

                          borderSide:
                          BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    if (otpVisible)

                      TextField(

                        controller:
                        otpController,

                        keyboardType:
                        TextInputType.number,

                        decoration:
                        InputDecoration(

                          hintText:
                          "Enter OTP",

                          filled: true,

                          fillColor:
                          Colors.grey.shade100,

                          border:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                                15),

                            borderSide:
                            BorderSide.none,
                          ),
                        ),
                      ),

                    const SizedBox(height: 30),

                    SizedBox(

                      width: double.infinity,
                      height: 60,

                      child: ElevatedButton(

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(
                              0xff5F259F),
                        ),

                        onPressed:
                        otpVisible
                            ? verifyOTP
                            : sendOTP,

                        child: Text(

                          otpVisible
                              ? "Verify OTP"
                              : "Send OTP",

                          style:
                          const TextStyle(
                            color:
                            Colors.white,

                            fontSize: 18,
                          ),
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
}