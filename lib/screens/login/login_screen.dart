import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  bool otpVisible = false;
  Future signInWithGoogle() async {

    try {

      final GoogleSignInAccount? googleUser =
      await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication
      googleAuth =
      await googleUser.authentication;

      final credential =
      GoogleAuthProvider.credential(

        accessToken:
        googleAuth.accessToken,

        idToken:
        googleAuth.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(
        credential,
      );

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder: (context) =>
          const HomeScreen(),
        ),
      );

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            "Google Sign In Failed",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF5F7FB),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding:
            const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),

            child: Column(

              children: [

                const SizedBox(height: 40),

                // LOGO
                Container(

                  height: 130,
                  width: 130,

                  decoration:
                  BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(35),

                    boxShadow: [

                      BoxShadow(

                        color:
                        Colors.blue.withValues(
                          alpha: 0.15,
                        ),

                        blurRadius: 20,

                        offset:
                        const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: const Center(

                    child: Text(

                      "S",

                      style: TextStyle(

                        fontSize: 80,

                        fontWeight:
                        FontWeight.bold,

                        color:
                        Color(0xff1565C0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // APP NAME
                const Text(

                  "FinPay",

                  style: TextStyle(

                    fontSize: 42,

                    fontWeight:
                    FontWeight.bold,

                    color:
                    Color(0xff0D1B6F),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(

                  "Pay • Send • Receive",

                  style: TextStyle(

                    color: Colors.grey,

                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 50),

                // PHONE FIELD
                TextField(

                  controller:
                  phoneController,

                  keyboardType:
                  TextInputType.phone,

                  maxLength: 10,

                  decoration:
                  InputDecoration(

                    hintText:
                    "Enter Mobile Number",

                    prefixIcon:
                    const Icon(Icons.phone),

                    filled: true,

                    fillColor:
                    Colors.white,

                    border:
                    OutlineInputBorder(

                      borderRadius:
                      BorderRadius.circular(
                          18),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),

                // OTP FIELD
                if (otpVisible)

                  Column(

                    children: [

                      const SizedBox(
                          height: 15),

                      TextField(

                        controller:
                        otpController,

                        keyboardType:
                        TextInputType.number,

                        maxLength: 6,

                        decoration:
                        InputDecoration(

                          hintText:
                          "Enter OTP",

                          prefixIcon:
                          const Icon(
                              Icons.lock),

                          filled: true,

                          fillColor:
                          Colors.white,

                          border:
                          OutlineInputBorder(

                            borderRadius:
                            BorderRadius.circular(
                                18),

                            borderSide:
                            BorderSide.none,
                          ),
                        ),
                      ),

                      const Text(

                        "Demo OTP: 123456",

                        style: TextStyle(
                          color:
                          Colors.grey,
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 30),

                // LOGIN BUTTON
                Container(

                  width: double.infinity,
                  height: 60,

                  decoration:
                  BoxDecoration(

                    gradient:
                    const LinearGradient(

                      colors: [

                        Color(0xff1565C0),

                        Color(0xff42A5F5),
                      ],
                    ),

                    borderRadius:
                    BorderRadius.circular(
                        18),
                  ),

                  child:
                  ElevatedButton.icon(

                    style:
                    ElevatedButton
                        .styleFrom(

                      backgroundColor:
                      Colors.transparent,

                      shadowColor:
                      Colors.transparent,
                    ),

                    onPressed: () {

                      if (!otpVisible) {

                        if (phoneController
                            .text.length !=
                            10) {

                          ScaffoldMessenger.of(
                              context)
                              .showSnackBar(

                            const SnackBar(

                              content: Text(
                                "Enter valid 10 digit number",
                              ),
                            ),
                          );

                          return;
                        }

                        setState(() {

                          otpVisible = true;
                        });

                      } else {

                        if (otpController
                            .text ==
                            "123456") {

                          Navigator.pushReplacement(

                            context,

                            MaterialPageRoute(

                              builder:
                                  (context) =>
                              const HomeScreen(),
                            ),
                          );

                        } else {

                          ScaffoldMessenger.of(
                              context)
                              .showSnackBar(

                            const SnackBar(

                              content: Text(
                                "Invalid OTP",
                              ),
                            ),
                          );
                        }
                      }
                    },

                    icon: const Icon(

                      Icons.phone_android,

                      color: Colors.white,
                    ),

                    label: Text(

                      otpVisible

                          ? "Verify OTP"

                          : "Login with Mobile Number",

                      style:
                      const TextStyle(

                        color:
                        Colors.white,

                        fontSize: 18,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // GOOGLE BUTTON
                OutlinedButton.icon(

                  onPressed: () async {

                    await signInWithGoogle();
                  },

                  style:
                  OutlinedButton.styleFrom(

                    minimumSize:
                    const Size(
                      double.infinity,
                      60,
                    ),

                    side: const BorderSide(

                      color:
                      Color(0xff1565C0),

                      width: 2,
                    ),

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                  ),

                  icon: const Icon(
                    Icons.g_mobiledata,
                    size: 35,
                    color: Colors.red,
                  ),

                  label: const Text(

                    "Continue with Google",

                    style: TextStyle(

                      color:
                      Color(0xff1565C0),

                      fontSize: 18,

                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // OR
                Row(

                  children: [

                    Expanded(

                      child: Divider(
                        color:
                        Colors.grey.shade300,
                      ),
                    ),

                    const Padding(

                      padding:
                      EdgeInsets.symmetric(
                          horizontal: 15),

                      child: Text(

                        "OR",

                        style: TextStyle(
                          color:
                          Colors.grey,
                        ),
                      ),
                    ),

                    Expanded(

                      child: Divider(
                        color:
                        Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // FEATURES
                Row(

                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,

                  children: [

                    featureItem(
                      Icons.security,
                      "Secure",
                    ),

                    featureItem(
                      Icons.flash_on,
                      "Instant",
                    ),

                    featureItem(
                      Icons.wallet,
                      "Convenient",
                    ),

                    featureItem(
                      Icons.support_agent,
                      "24/7",
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // CREATE ACCOUNT
                const Text(

                  "New to FinPay?",

                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 15),

                OutlinedButton(

                  style:
                  OutlinedButton
                      .styleFrom(

                    minimumSize:
                    const Size(
                      double.infinity,
                      60,
                    ),

                    side:
                    const BorderSide(

                      color:
                      Color(0xff1565C0),

                      width: 2,
                    ),

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),
                  ),

                  onPressed: () {

                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Create Account Clicked",
                        ),
                      ),
                    );
                  },

                  child: const Text(

                    "Create New Account",

                    style: TextStyle(

                      color:
                      Color(0xff1565C0),

                      fontSize: 18,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget featureItem(
      IconData icon,
      String title,
      ) {

    return Column(

      children: [

        CircleAvatar(

          radius: 28,

          backgroundColor:
          const Color(0xffE3F2FD),

          child: Icon(

            icon,

            color:
            const Color(0xff1565C0),
          ),
        ),

        const SizedBox(height: 10),

        Text(

          title,

          style: const TextStyle(

            fontWeight:
            FontWeight.w600,
          ),
        ),
      ],
    );
  }
}