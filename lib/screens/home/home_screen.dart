import 'package:flutter/material.dart';

import '../qr/qr_screen.dart';

import '../savings/savings_screen.dart';

import '../qr/qr_screen.dart';

import '../history/history_screen.dart';

import '../profile/profile_screen.dart';

import '../bank/bank_screen.dart';

import '../card/card_screen.dart';

import '../transfer/transfer_screen.dart';

import '../bills/bills_screen.dart';

import '../recharge/recharge_screen.dart';

import '../more/more_screen.dart';

import '../transactions/transactions_screen.dart';



import '../../services/transaction_service.dart';
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
    "Transactions",
    "Transfer",
    "Profile",
  ];

  final List<Widget> screens = [

    const HomePage(),

    const TransactionsScreen(),

    const QrScreen(),

    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF5F7FB),

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

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

            child: CircleAvatar(

              backgroundColor:
              Colors.white,

              child: Icon(

                Icons.person,

                color:
                const Color(
                    0xff1565C0),
              ),
            ),
          ),
        ],
      ),

      body: screens[currentIndex],

      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex:
        currentIndex,

        selectedItemColor:
        const Color(0xff1565C0),

        unselectedItemColor:
        Colors.grey,

        type:
        BottomNavigationBarType.fixed,

        onTap: (index) {

          setState(() {

            currentIndex =
                index;
          });
        },

        items: const [

          BottomNavigationBarItem(

            icon:
            Icon(Icons.home),

            label: "Home",
          ),

          BottomNavigationBarItem(

            icon:
            Icon(Icons.history),

            label:
            "Transactions",
          ),

          BottomNavigationBarItem(

            icon:
            Icon(Icons.send),

            label: "Transfer",
          ),

          BottomNavigationBarItem(

            icon:
            Icon(Icons.person),

            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: SingleChildScrollView(

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            mainAxisSize:
            MainAxisSize.min,

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // BALANCE CARD
              Container(

                width: double.infinity,

                padding:
                const EdgeInsets.all(22),

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
                      25),
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

                        const Text(

                          "HDFC Bank",

                          style: TextStyle(

                            color:
                            Colors.white70,

                            fontSize: 18,
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
                            Colors.white24,

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

                              fontSize:
                              12,

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

                        fontSize: 40,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    const Text(

                      "XXXX 4587",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // QUICK ACTIONS
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

                crossAxisCount: 4,

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                childAspectRatio: 0.8,

                children: [

                  quickButton(
                    context,
                    Icons.qr_code,
                    "Pay",
                    const QrScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.history,
                    "Transactions",
                    const TransactionsScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.send,
                    "Transfer",
                    const TransferScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.receipt_long,
                    "Bills",
                    const BillsScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.phone_android,
                    "Recharge",
                    const RechargeScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.account_balance,
                    "Bank",
                    const BankScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.savings,
                    "Savings",
                    const SavingsScreen(),
                  ),

                  quickButton(
                    context,
                    Icons.more_horiz,
                    "More",
                    const MoreScreen(),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // SERVICES
              serviceCard(
                context,
                "📱",
                "Mobile Recharge",
              ),

              serviceCard(
                context,
                "💡",
                "Electricity Bill",
              ),

              serviceCard(
                context,
                "✈️",
                "Flight Booking",
              ),

              serviceCard(
                context,
                "🏨",
                "Hotel Booking",
              ),

              serviceCard(
                context,
                "🎬",
                "Movie Tickets",
              ),

              serviceCard(
                context,
                "🛡️",
                "Insurance",
              ),

              const SizedBox(height: 30),

              // TRANSACTIONS
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

                "Amazon Shopping",
                "- ₹499",
              ),

              transactionTile(

                "Salary Credit",
                "+ ₹50,000",
              ),

              transactionTile(

                "Electricity Bill",
                "- ₹1,250",
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickButton(

      BuildContext context,

      IconData icon,

      String title,

      Widget screen) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (context) =>
            screen,
          ),
        );
      },

      child: Column(

        children: [

          Container(

            height: 60,
            width: 60,

            decoration:
            BoxDecoration(

              color:
              const Color(
                  0xffE3F2FD),

              borderRadius:
              BorderRadius.circular(
                  18),
            ),

            child: Icon(

              icon,

              color:
              const Color(
                  0xff1565C0),
            ),
          ),

          const SizedBox(height: 8),

          Text(

            title,

            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(

      BuildContext context,

      String emoji,

      String title) {

    return GestureDetector(

      onTap: () {

        showDialog(

          context: context,

          builder: (context) {

            return AlertDialog(

              shape:
              RoundedRectangleBorder(

                borderRadius:
                BorderRadius.circular(
                    20),
              ),

              title: Text(title),

              content: Column(

                mainAxisSize:
                MainAxisSize.min,

                children: [

                  Text(

                    emoji,

                    style:
                    const TextStyle(
                      fontSize: 60,
                    ),
                  ),

                  const SizedBox(
                      height: 20),

                  Text(

                    "$title service coming soon.",

                    textAlign:
                    TextAlign.center,

                    style:
                    const TextStyle(

                      fontSize: 18,
                    ),
                  ),
                ],
              ),

              actions: [

                TextButton(

                  onPressed: () {

                    Navigator.pop(
                        context);
                  },

                  child: const Text(
                    "Close",
                  ),
                ),
              ],
            );
          },
        );
      },

      child: Container(

        margin:
        const EdgeInsets.only(
            bottom: 15),

        padding:
        const EdgeInsets.all(18),

        decoration:
        BoxDecoration(

          color: Colors.white,

          borderRadius:
          BorderRadius.circular(
              20),

          boxShadow: [

            BoxShadow(

              color:
              Colors.black.withValues(
                alpha: 0.05,
              ),

              blurRadius: 10,

              offset:
              const Offset(0, 4),
            ),
          ],
        ),

        child: Row(

          children: [

            Container(

              height: 55,
              width: 55,

              decoration:
              BoxDecoration(

                color:
                const Color(
                    0xffE3F2FD),

                borderRadius:
                BorderRadius.circular(
                    15),
              ),

              child: Center(

                child: Text(

                  emoji,

                  style:
                  const TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Text(

                title,

                style:
                const TextStyle(

                  fontSize: 17,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const Icon(

              Icons.arrow_forward_ios,

              size: 18,

              color:
              Color(0xff1565C0),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionTile(

      String title,
      String amount) {

    return Container(

      margin:
      const EdgeInsets.only(
          bottom: 15),

      padding:
      const EdgeInsets.all(18),

      decoration:
      BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(
            20),
      ),

      child: Row(

        children: [

          CircleAvatar(

            backgroundColor:
            const Color(
                0xffE3F2FD),

            child: Icon(

              Icons.wallet,

              color:
              const Color(
                  0xff1565C0),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                Text(

                  title,

                  style:
                  const TextStyle(

                    fontSize: 16,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 4),

                const Text(
                  "Today",
                ),
              ],
            ),
          ),

          Text(

            amount,

            style: TextStyle(

              color:
              amount.contains("+")
                  ? Colors.green
                  : Colors.red,

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