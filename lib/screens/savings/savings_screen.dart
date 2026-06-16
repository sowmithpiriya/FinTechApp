import 'package:flutter/material.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

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

          "Savings",

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

              // SAVINGS CARD
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

                      "Total Savings",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(

                      "₹ 1,25,000",

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

                      "Updated Today",

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

                "Savings Plans",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              savingsTile(

                icon:
                Icons.savings,

                title:
                "Emergency Fund",

                subtitle:
                "Safe savings for emergencies",

                amount:
                "₹50,000",
              ),

              savingsTile(

                icon:
                Icons.flight,

                title:
                "Travel Goal",

                subtitle:
                "Dubai trip savings",

                amount:
                "₹25,000",
              ),

              savingsTile(

                icon:
                Icons.home,

                title:
                "Home Fund",

                subtitle:
                "Future home investment",

                amount:
                "₹35,000",
              ),

              savingsTile(

                icon:
                Icons.phone_iphone,

                title:
                "Gadget Savings",

                subtitle:
                "New iPhone purchase",

                amount:
                "₹15,000",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget savingsTile({

    required IconData icon,

    required String title,

    required String subtitle,

    required String amount,
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

          style: const TextStyle(

            color:
            Color(0xff1565C0),

            fontWeight:
            FontWeight.bold,

            fontSize: 16,
          ),
        ),
      ),
    );
  }
}