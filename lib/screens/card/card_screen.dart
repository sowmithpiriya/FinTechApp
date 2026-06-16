import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xff1565C0),

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        title: const Text(

          "My Debit Card",

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

            // ATM CARD
            Container(

              width: double.infinity,

              height: 230,

              padding:
              const EdgeInsets.all(25),

              decoration: BoxDecoration(

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
                CrossAxisAlignment
                    .start,

                children: [

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      const Text(

                        "RuPay Platinum",

                        style: TextStyle(

                          color:
                          Colors.white,

                          fontSize: 20,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      Container(

                        padding:
                        const EdgeInsets
                            .symmetric(

                          horizontal: 10,

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

                        child: const Text(

                          "ACTIVE",

                          style: TextStyle(
                            color:
                            Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 30),

                  const Text(

                    "4587 2145 7896 3214",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 24,

                      letterSpacing: 3,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      Column(

                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          const Text(

                            "VALID THRU",

                            style: TextStyle(

                              color:
                              Colors.white70,

                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(
                              height: 5),

                          const Text(

                            "12/30",

                            style: TextStyle(

                              color:
                              Colors.white,

                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      Column(

                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          const Text(

                            "CVV",

                            style: TextStyle(

                              color:
                              Colors.white70,

                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(
                              height: 5),

                          const Text(

                            "458",

                            style: TextStyle(

                              color:
                              Colors.white,

                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 20),

                  const Text(

                    "SOWMITH",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 18,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ACCOUNT DETAILS
            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                    20),
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  const Text(

                    "Account Details",

                    style: TextStyle(

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  detailTile(
                    "Bank",
                    "HDFC Bank",
                  ),

                  detailTile(
                    "Account Number",
                    "XXXX4587",
                  ),

                  detailTile(
                    "IFSC",
                    "HDFC0004587",
                  ),

                  detailTile(
                    "Available Balance",
                    "₹25,450",
                  ),

                  detailTile(
                    "UPI ID",
                    "sowmith@finpay",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTile(
      String title,
      String value,
      ) {

    return Padding(

      padding:
      const EdgeInsets.only(
          bottom: 20),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment
            .spaceBetween,

        children: [

          Text(

            title,

            style: const TextStyle(

              color: Colors.grey,

              fontSize: 16,
            ),
          ),

          Text(

            value,

            style: const TextStyle(

              fontSize: 16,

              fontWeight:
              FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}