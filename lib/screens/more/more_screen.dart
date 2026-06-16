import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        title: const Text(

          "More Services",

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: GridView.count(

          crossAxisCount: 2,

          crossAxisSpacing: 20,

          mainAxisSpacing: 20,

          children: [

            serviceCard(
              Icons.account_balance,
              "Personal Loan",
            ),

            serviceCard(
              Icons.directions_car,
              "Vehicle Loan",
            ),

            serviceCard(
              Icons.currency_rupee,
              "Gold Loan",
            ),

            serviceCard(
              Icons.trending_up,
              "Mutual Funds",
            ),

            serviceCard(
              Icons.credit_card,
              "Credit Cards",
            ),

            serviceCard(
              Icons.savings,
              "Investments",
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard(
      IconData icon,
      String title,
      ) {

    return Container(

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black12,

            blurRadius: 8,
          ),
        ],
      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          CircleAvatar(

            radius: 32,

            backgroundColor:
            const Color(0xffE3F2FD),

            child: Icon(

              icon,

              size: 32,

              color:
              const Color(0xff1565C0),
            ),
          ),

          const SizedBox(height: 15),

          Text(

            title,

            style: const TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}