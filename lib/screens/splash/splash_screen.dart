import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Future.delayed(

      const Duration(seconds: 3),

          () {

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (_) =>
            const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xff1565C0),

      body: Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(

              height: 110,
              width: 110,

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(30),
              ),

              child: const Icon(

                Icons.account_balance_wallet,

                color:
                Color(0xff1565C0),

                size: 60,
              ),
            ),

            const SizedBox(height: 30),

            const Text(

              "Scredope",

              style: TextStyle(

                color: Colors.white,

                fontSize: 40,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(

              "Pay • Send • Receive",

              style: TextStyle(

                color: Colors.white70,

                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}