import 'package:flutter/material.dart';

import '../../services/transaction_service.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() =>
      _QrScreenState();
}

class _QrScreenState
    extends State<QrScreen> {

  final phoneController =
  TextEditingController();

  final amountController =
  TextEditingController();

  final pinController =
  TextEditingController();

  bool loading = false;

  void sendMoney() async {

    String phone =
        phoneController.text;

    String amountText =
        amountController.text;

    String pin =
        pinController.text;

    if (phone.length != 10) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content: Text(
            "Enter valid 10 digit number",
          ),
        ),
      );

      return;
    }

    if (amountText.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content: Text(
            "Enter amount",
          ),
        ),
      );

      return;
    }

    if (pin != "2020") {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content: Text(
            "Wrong UPI PIN",
          ),
        ),
      );

      return;
    }

    int amount =
    int.parse(amountText);

    setState(() {
      loading = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    TransactionService.sendMoney(
      amount,
    );

    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        backgroundColor:
        Colors.green,

        content: Text(
          "₹$amount sent to $phone successfully",
        ),
      ),
    );

    phoneController.clear();
    amountController.clear();
    pinController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xffF5F5F5),

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        elevation: 0,

        title: const Text(

          "Transfer Money",

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

                      "Quick Transfer",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(

                      "Send Money\nInstantly",

                      style: TextStyle(

                        color:
                        Colors.white,

                        fontSize: 38,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(

                "Mobile Number",

                style: TextStyle(

                  fontSize: 18,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextField(

                controller:
                phoneController,

                keyboardType:
                TextInputType.phone,

                maxLength: 10,

                decoration:
                InputDecoration(

                  hintText:
                  "Enter 10 digit number",

                  prefixIcon:
                  const Icon(
                    Icons.phone,
                  ),

                  filled: true,

                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        16),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(

                "Amount",

                style: TextStyle(

                  fontSize: 18,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              TextField(

                controller:
                amountController,

                keyboardType:
                TextInputType.number,

                decoration:
                InputDecoration(

                  hintText:
                  "Enter amount",

                  prefixIcon:
                  const Icon(
                    Icons.currency_rupee,
                  ),

                  filled: true,

                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        16),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(

                "UPI PIN",

                style: TextStyle(

                  fontSize: 18,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

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
                  "Enter UPI PIN",

                  prefixIcon:
                  const Icon(
                    Icons.lock,
                  ),

                  filled: true,

                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        16),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,

                height: 60,

                child: ElevatedButton(

                  style:
                  ElevatedButton
                      .styleFrom(

                    backgroundColor:
                    const Color(
                        0xff1565C0),

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),
                  ),

                  onPressed:
                  loading
                      ? null
                      : sendMoney,

                  child: loading

                      ? const CircularProgressIndicator(
                    color:
                    Colors.white,
                  )

                      : const Text(

                    "Send Money",

                    style: TextStyle(

                      color:
                      Colors.white,

                      fontSize: 20,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(

                "Recent Contacts",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              contactCard(
                context,
                "Rahul Sharma",
                "+91 9876543210",
              ),

              contactCard(
                context,
                "Anjali Verma",
                "+91 9123456780",
              ),

              contactCard(
                context,
                "Suresh Kumar",
                "+91 9988776655",
              ),

              contactCard(
                context,
                "Priya Reddy",
                "+91 9090909090",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactCard(
      BuildContext context,
      String name,
      String phone,
      ) {

    return Container(

      margin:
      const EdgeInsets.only(
          bottom: 15),

      padding:
      const EdgeInsets.all(15),

      decoration:
      BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(18),

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

            radius: 26,

            backgroundColor:
            const Color(0xffE3F2FD),

            child: const Icon(

              Icons.person,

              color:
              Color(0xff1565C0),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  name,

                  style:
                  const TextStyle(

                    fontSize: 18,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 5),

                Text(

                  phone,

                  style:
                  const TextStyle(

                    color:
                    Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(

            style:
            ElevatedButton.styleFrom(

              backgroundColor:
              const Color(0xff1565C0),
            ),

            onPressed: () {

              phoneController.text =
                  phone.replaceAll(
                      "+91 ", "");
            },

            child: const Text(

              "Pay",

              style: TextStyle(
                color:
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}