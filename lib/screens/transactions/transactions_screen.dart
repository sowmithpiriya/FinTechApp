import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        elevation: 0,

        title: const Text(

          "Transactions",

          style: TextStyle(

            color: Colors.white,

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // SUMMARY CARD
              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(25),

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
                  BorderRadius.circular(25),
                ),

                child: const Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(

                      "This Month",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(

                      "₹ 18,450",

                      style: TextStyle(

                        color:
                        Colors.white,

                        fontSize: 38,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(

                      "Total Spent",

                      style: TextStyle(

                        color:
                        Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(

                "Recent Transactions",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              transactionTile(

                icon:
                Icons.shopping_bag,

                title:
                "Amazon Shopping",

                subtitle:
                "Today • 2:30 PM",

                amount:
                "- ₹499",

                amountColor:
                Colors.red,
              ),

              transactionTile(

                icon:
                Icons.account_balance_wallet,

                title:
                "Salary Credit",

                subtitle:
                "Today • 9:00 AM",

                amount:
                "+ ₹50,000",

                amountColor:
                Colors.green,
              ),

              transactionTile(

                icon:
                Icons.lightbulb,

                title:
                "Electricity Bill",

                subtitle:
                "Yesterday",

                amount:
                "- ₹1,200",

                amountColor:
                Colors.red,
              ),

              transactionTile(

                icon:
                Icons.movie,

                title:
                "Netflix",

                subtitle:
                "Yesterday",

                amount:
                "- ₹649",

                amountColor:
                Colors.red,
              ),

              transactionTile(

                icon:
                Icons.fastfood,

                title:
                "Swiggy Food",

                subtitle:
                "2 Days Ago",

                amount:
                "- ₹320",

                amountColor:
                Colors.red,
              ),

              transactionTile(

                icon:
                Icons.phone_android,

                title:
                "Mobile Recharge",

                subtitle:
                "3 Days Ago",

                amount:
                "- ₹299",

                amountColor:
                Colors.red,
              ),

              transactionTile(

                icon:
                Icons.person,

                title:
                "Money Received",

                subtitle:
                "4 Days Ago",

                amount:
                "+ ₹2,000",

                amountColor:
                Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionTile({

    required IconData icon,

    required String title,

    required String subtitle,

    required String amount,

    required Color amountColor,
  }) {

    return Card(

      margin:
      const EdgeInsets.only(
          bottom: 15),

      shape: RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: ListTile(

        contentPadding:
        const EdgeInsets.symmetric(

          horizontal: 18,
          vertical: 10,
        ),

        leading: CircleAvatar(

          radius: 28,

          backgroundColor:
          const Color(0xffE3F2FD),

          child: Icon(

            icon,

            color:
            const Color(0xff1565C0),
          ),
        ),

        title: Text(

          title,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,

            fontSize: 16,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: Text(

          amount,

          style: TextStyle(

            color: amountColor,

            fontWeight:
            FontWeight.bold,

            fontSize: 16,
          ),
        ),
      ),
    );
  }
}