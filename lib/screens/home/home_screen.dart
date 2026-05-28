import 'package:flutter/material.dart';

import '../qr/qr_screen.dart';
import '../history/history_screen.dart';
import '../profile/profile_screen.dart';
import '../bank/bank_screen.dart';
import '../card/card_screen.dart';
import '../transfer/transfer_screen.dart';
import '../bills/bills_screen.dart';
import '../recharge/recharge_screen.dart';
import '../more/more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  int currentIndex = 0;

  final List<String> titles = [

    "Home",
    "Search",
    "Scanner",
    "Alerts",
    "History",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        elevation: 0,

        title: Text(

          titles[currentIndex],

          style: const TextStyle(

            color: Colors.white,

            fontWeight:
            FontWeight.bold,
          ),
        ),

        actions: [

          Padding(

            padding:
            const EdgeInsets.only(
                right: 15),

            child: GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>
                    const ProfileScreen(),
                  ),
                );
              },

              child: CircleAvatar(

                backgroundColor:
                Colors.white,

                child: Icon(

                  Icons.person,

                  color:
                  Colors.deepPurple
                      .shade700,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: pages[currentIndex],
      ),

      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex: currentIndex,

        selectedItemColor:
        const Color(0xff5F259F),

        unselectedItemColor:
        Colors.grey,

        type:
        BottomNavigationBarType
            .fixed,

        onTap: (index) {

          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon:
            Icon(Icons.qr_code_scanner),
            label: "Scanner",
          ),

          BottomNavigationBarItem(
            icon:
            Icon(Icons.notifications),
            label: "Alerts",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
      ),
    );
  }

  List<Widget> get pages => [

    // HOME PAGE
    SingleChildScrollView(

      child: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment
              .start,

          children: [

            // CLICKABLE BALANCE CARD
            GestureDetector(

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>
                    const CardScreen(),
                  ),
                );
              },

              child: Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(
                    25),

                decoration:
                BoxDecoration(

                  gradient:
                  const LinearGradient(

                    colors: [

                      Color(0xff5F259F),

                      Color(0xff7E57C2),
                    ],
                  ),

                  borderRadius:
                  BorderRadius
                      .circular(25),

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.deepPurple
                          .withValues(
                          alpha:
                          0.3),

                      blurRadius: 15,

                      offset:
                      const Offset(
                          0, 8),
                    ),
                  ],
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

                  children: [

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                      children: [

                        const Text(

                          "Total Balance",

                          style:
                          TextStyle(

                            color:
                            Colors
                                .white70,

                            fontSize: 16,
                          ),
                        ),

                        Container(

                          padding:
                          const EdgeInsets
                              .symmetric(

                            horizontal:
                            12,

                            vertical: 5,
                          ),

                          decoration:
                          BoxDecoration(

                            color:
                            Colors
                                .white24,

                            borderRadius:
                            BorderRadius
                                .circular(
                                20),
                          ),

                          child:
                          const Text(

                            "ACTIVE",

                            style:
                            TextStyle(

                              color: Colors
                                  .white,

                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 25),

                    const Text(

                      "₹25,450",

                      style: TextStyle(

                        color:
                        Colors.white,

                        fontSize: 38,

                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                      children: [

                        const Text(

                          "**** 4587",

                          style:
                          TextStyle(

                            color:
                            Colors
                                .white70,

                            letterSpacing:
                            4,

                            fontSize: 16,
                          ),
                        ),

                        Container(

                          padding:
                          const EdgeInsets
                              .symmetric(

                            horizontal:
                            10,

                            vertical: 5,
                          ),

                          decoration:
                          BoxDecoration(

                            color:
                            Colors
                                .white24,

                            borderRadius:
                            BorderRadius
                                .circular(
                                20),
                          ),

                          child:
                          const Row(

                            children: [

                              Icon(

                                Icons
                                    .credit_card,

                                color: Colors
                                    .white,

                                size: 18,
                              ),

                              SizedBox(
                                  width:
                                  5),

                              Text(

                                "RuPay",

                                style:
                                TextStyle(
                                  color: Colors
                                      .white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20),

                    const Text(

                      "Tap to view card details",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(

              "Quick Actions",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(

              crossAxisCount: 4,

              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),

              children: [

                // PAY
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const QRScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.qr_code,
                    "Pay",
                  ),
                ),

                // TRANSACTIONS
                GestureDetector(

                  onTap: () {

                    setState(() {
                      currentIndex = 4;
                    });
                  },

                  child: quickButton(
                    Icons.history,
                    "Transactions",
                  ),
                ),

                // TRANSFER
                // TRANSFER
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const TransferScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.send,
                    "Transfer",
                  ),
                ),

                // BILLS
                // BILLS
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const BillsScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.receipt_long,
                    "Bills",
                  ),
                ),

                // RECHARGE
                // RECHARGE
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const RechargeScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.phone_android,
                    "Recharge",
                  ),
                ),

                // BANK
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const BankScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.account_balance,
                    "Bank",
                  ),
                ),

                // SAVINGS
                GestureDetector(

                  child: quickButton(
                    Icons.savings,
                    "Savings",
                  ),
                ),

                // MORE
                // MORE
                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const MoreScreen(),
                      ),
                    );
                  },

                  child: quickButton(
                    Icons.more_horiz,
                    "More",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Text(

              "Recent Transactions",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            transactionTile(
              "Amazon Shopping",
              "- ₹499",
              Icons.shopping_bag,
            ),

            transactionTile(
              "Salary Credit",
              "+ ₹50,000",
              Icons.account_balance_wallet,
            ),

            transactionTile(
              "Electricity Bill",
              "- ₹1,200",
              Icons.lightbulb,
            ),

            transactionTile(
              "Netflix",
              "- ₹649",
              Icons.movie,
            ),
          ],
        ),
      ),
    ),

    // SEARCH PAGE
    const Center(
      child: Text("Search Screen"),
    ),

    // SCANNER PAGE
    const Center(
      child: Icon(
        Icons.qr_code_scanner,
        size: 120,
      ),
    ),

    // ALERTS PAGE
    const Center(
      child: Text("No New Alerts"),
    ),

    // HISTORY PAGE
    const HistoryScreen(),
  ];

  static Widget quickButton(
      IconData icon,
      String title,
      ) {

    return Column(

      children: [

        CircleAvatar(

          radius: 30,

          backgroundColor:
          const Color(0xffEFE7FF),

          child: Icon(

            icon,

            color:
            const Color(0xff5F259F),
          ),
        ),

        const SizedBox(height: 10),

        Text(title),
      ],
    );
  }

  static Widget transactionTile(
      String title,
      String amount,
      IconData icon,
      ) {

    return Card(

      margin:
      const EdgeInsets.only(
          bottom: 12),

      shape: RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(15),
      ),

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor:
          const Color(0xffEFE7FF),

          child: Icon(

            icon,

            color:
            const Color(0xff5F259F),
          ),
        ),

        title: Text(title),

        subtitle:
        const Text("Today"),

        trailing: Text(

          amount,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}