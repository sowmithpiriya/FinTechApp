import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

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

              // TOP CARD
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

                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(

                      "Send Money\nInstantly",

                      style: TextStyle(

                        color:
                        Colors.white,

                        fontSize: 34,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(

                "Recent Contacts",

                style: TextStyle(

                  fontSize: 22,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              contactTile(
                context,
                "Rahul Sharma",
                "+91 9876543210",
                Icons.person,
              ),

              contactTile(
                context,
                "Anjali Verma",
                "+91 9123456780",
                Icons.person,
              ),

              contactTile(
                context,
                "Suresh Kumar",
                "+91 9988776655",
                Icons.person,
              ),

              contactTile(
                context,
                "Priya Reddy",
                "+91 9090909090",
                Icons.person,
              ),

              contactTile(
                context,
                "Arjun Patel",
                "+91 8888888888",
                Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactTile(

      BuildContext context,

      String name,

      String number,

      IconData icon,
      ) {

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

          name,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,

            fontSize: 16,
          ),
        ),

        subtitle: Text(number),

        trailing: ElevatedButton(

          style:
          ElevatedButton.styleFrom(

            backgroundColor:
            const Color(0xff1565C0),

            shape:
            RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(
                  12),
            ),
          ),

          onPressed: () {

            showDialog(

              context: context,

              builder: (context) {

                final amountController =
                TextEditingController();

                return AlertDialog(

                  title: Text(
                    "Send Money to $name",
                  ),

                  content: TextField(

                    controller:
                    amountController,

                    keyboardType:
                    TextInputType.number,

                    decoration:
                    const InputDecoration(

                      hintText:
                      "Enter Amount",
                    ),
                  ),

                  actions: [

                    TextButton(

                      onPressed: () {

                        Navigator.pop(
                            context);
                      },

                      child:
                      const Text(
                          "Cancel"),
                    ),

                    ElevatedButton(

                      onPressed: () {

                        Navigator.pop(
                            context);

                        ScaffoldMessenger.of(
                            context)
                            .showSnackBar(

                          SnackBar(

                            content: Text(

                              "₹${amountController.text} sent to $name",
                            ),
                          ),
                        );
                      },

                      child:
                      const Text(
                          "Send"),
                    ),
                  ],
                );
              },
            );
          },

          child: const Text(

            "Pay",

            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}