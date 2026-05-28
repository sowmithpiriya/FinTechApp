import 'package:flutter/material.dart';

import '../bank/bank_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.deepPurple,

        title: const Text(

          "FinPay",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          Padding(

            padding: const EdgeInsets.only(
              right: 15,
            ),

            child: CircleAvatar(

              backgroundColor: Colors.white,

              child: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const Text(

                "Good Evening 👋",

                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 5),

              const Text(

                "Sowmith",

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // BALANCE CARD
              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(24),

                decoration: BoxDecoration(

                  gradient:
                  const LinearGradient(

                    colors: [
                      Colors.deepPurple,
                      Colors.purple,
                    ],
                  ),

                  borderRadius:
                  BorderRadius.circular(
                      24),
                ),

                child: const Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(

                      "Available Balance",

                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(

                      "₹ 25,000",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(

                      "Updated just now",

                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(

                "Quick Actions",

                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              GridView.count(

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                crossAxisCount: 2,

                crossAxisSpacing: 20,

                mainAxisSpacing: 20,

                children: [

                  actionCard(

                    context: context,

                    icon: Icons.qr_code,

                    title: "Pay QR",

                    color: Colors.deepPurple,
                  ),

                  actionCard(

                    context: context,

                    icon: Icons.history,

                    title: "Transactions",

                    color: Colors.orange,
                  ),

                  actionCard(

                    context: context,

                    icon:
                    Icons.account_balance,

                    title: "Bank",

                    color: Colors.green,

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                          const BankScreen(),
                        ),
                      );
                    },
                  ),

                  actionCard(

                    context: context,

                    icon: Icons.person,

                    title: "Profile",

                    color: Colors.blue,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // CASHBACK CARD
              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(
                      20),

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.black.withValues(
                          alpha: 0.05),

                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Row(

                  children: [

                    CircleAvatar(

                      radius: 30,

                      backgroundColor:
                      Colors.orange
                          .withValues(
                          alpha: 0.2),

                      child: const Icon(

                        Icons.local_offer,

                        color: Colors.orange,

                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(

                      child: Column(

                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          Text(

                            "Cashback Offer",

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(

                            "Get ₹100 cashback on your next payment.",

                            style: TextStyle(
                              color:
                              Colors.grey,
                            ),
                          ),
                        ],
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

  Widget actionCard({

    required BuildContext context,

    required IconData icon,

    required String title,

    required Color color,

    VoidCallback? onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(20),

          boxShadow: [

            BoxShadow(

              color:
              Colors.black.withValues(
                  alpha: 0.05),

              blurRadius: 10,
            ),
          ],
        ),

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            CircleAvatar(

              radius: 28,

              backgroundColor:
              color.withValues(
                  alpha: 0.15),

              child: Icon(

                icon,

                color: color,

                size: 30,
              ),
            ),

            const SizedBox(height: 15),

            Text(

              title,

              style: const TextStyle(

                fontSize: 18,

                fontWeight:
                FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}