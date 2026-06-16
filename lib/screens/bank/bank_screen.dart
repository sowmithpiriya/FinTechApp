import 'package:flutter/material.dart';

import '../../services/transaction_service.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF5F7FA),

      appBar: AppBar(

        elevation: 0,

        backgroundColor:
        const Color(0xff1565C0),

        title: const Text(

          "My Bank Accounts",

          style: TextStyle(
            color: Colors.white,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            bankCard(

              context: context,

              bankName:
              "HDFC Bank",

              account:
              "XXXX 4587",

              balance:
              "₹25,450",

              colors: const [

                Color(0xff1565C0),

                Color(0xff42A5F5),
              ],
            ),

            const SizedBox(height: 20),

            bankCard(

              context: context,

              bankName:
              "State Bank of India",

              account:
              "XXXX 9812",

              balance:
              "₹12,200",

              colors: const [

                Color(0xff0D47A1),

                Color(0xff1976D2),
              ],
            ),

            const SizedBox(height: 20),

            bankCard(

              context: context,

              bankName:
              "ICICI Bank",

              account:
              "XXXX 6721",

              balance:
              "₹8,750",

              colors: const [

                Color(0xff0277BD),

                Color(0xff29B6F6),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bankCard({

    required BuildContext context,

    required String bankName,

    required String account,

    required String balance,

    required List<Color> colors,
  }) {

    return GestureDetector(

      onTap: () {

        final pinController =
        TextEditingController();

        showDialog(

          context: context,

          builder: (_) {

            return AlertDialog(

              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(
                    20),
              ),

              title: Text(
                "Enter UPI PIN",
              ),

              content: Column(

                mainAxisSize:
                MainAxisSize.min,

                children: [

                  Text(
                    bankName,
                  ),

                  const SizedBox(
                      height: 15),

                  TextField(

                    controller:
                    pinController,

                    keyboardType:
                    TextInputType.number,

                    obscureText: true,

                    maxLength: 4,

                    decoration:
                    InputDecoration(

                      hintText:
                      "4-digit PIN",

                      filled: true,

                      fillColor:
                      Colors.grey
                          .shade100,

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
                ],
              ),

              actions: [

                TextButton(

                  onPressed: () {

                    Navigator.pop(
                        context);
                  },

                  child: const Text(
                      "Cancel"),
                ),

                ElevatedButton(

                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    const Color(
                        0xff1565C0),
                  ),

                  onPressed: () {

                    if (pinController
                        .text ==
                        "2020") {

                      TransactionService
                          .updateBank(

                        bank: bankName,

                        account: account,

                        balance: balance,
                      );

                      Navigator.pop(
                          context);

                      Navigator.pop(
                          context);

                    } else {

                      ScaffoldMessenger.of(
                          context)
                          .showSnackBar(

                        const SnackBar(

                          content: Text(
                            "Wrong UPI PIN",
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text(

                    "Verify",

                    style: TextStyle(
                      color:
                      Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },

      child: Container(

        width: double.infinity,

        padding:
        const EdgeInsets.all(24),

        decoration: BoxDecoration(

          gradient:
          LinearGradient(

            begin:
            Alignment.topLeft,

            end:
            Alignment.bottomRight,

            colors: colors,
          ),

          borderRadius:
          BorderRadius.circular(
              28),

          boxShadow: [

            BoxShadow(

              color: colors.first
                  .withOpacity(0.3),

              blurRadius: 15,

              offset:
              const Offset(0, 8),
            ),
          ],
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

                    fontSize: 24,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const Icon(

                  Icons.account_balance,

                  color:
                  Colors.white,

                  size: 28,
                ),
              ],
            ),

            const SizedBox(
                height: 35),

            Text(

              account,

              style:
              const TextStyle(

                color:
                Colors.white70,

                fontSize: 18,

                letterSpacing: 2,
              ),
            ),

            const SizedBox(
                height: 20),

            const Text(

              "₹ ••••••",

              style:
              TextStyle(

                color:
                Colors.white,

                fontSize: 34,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
                height: 12),

            const Text(

              "Tap to verify & view balance",

              style: TextStyle(

                color:
                Colors.white70,

                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}