import 'package:flutter/material.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF5F5F5),

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "My Bank Accounts",

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            bankCard(

              bankName:
              "HDFC Bank",

              account:
              "XXXX 4587",

              balance:
              "₹25,450",

              color:
              Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            bankCard(

              bankName:
              "State Bank of India",

              account:
              "XXXX 9812",

              balance:
              "₹12,200",

              color:
              Colors.blue,
            ),

            const SizedBox(height: 20),

            bankCard(

              bankName:
              "ICICI Bank",

              account:
              "XXXX 6721",

              balance:
              "₹8,750",

              color:
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget bankCard({

    required String bankName,
    required String account,
    required String balance,
    required Color color,
  }) {

    return Container(

      width: double.infinity,

      padding:
      const EdgeInsets.all(20),

      decoration: BoxDecoration(

        gradient: LinearGradient(

          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Row(

            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,

            children: [

              Text(

                bankName,

                style:
                const TextStyle(

                  color:
                  Colors.white,

                  fontSize: 22,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const Icon(
                Icons.account_balance,

                color:
                Colors.white,
              ),
            ],
          ),

          const SizedBox(height: 30),

          Text(

            account,

            style:
            const TextStyle(

              color:
              Colors.white70,

              fontSize: 18,
            ),
          ),

          const SizedBox(height: 15),

          Text(

            balance,

            style:
            const TextStyle(

              color:
              Colors.white,

              fontSize: 32,

              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}