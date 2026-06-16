import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

          "Profile",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding:
          const EdgeInsets.all(20),

          child: Column(

            children: [

              // PROFILE CARD
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

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.blue.withValues(
                        alpha: 0.3,
                      ),

                      blurRadius: 15,

                      offset:
                      const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(

                  children: [

                    const CircleAvatar(

                      radius: 45,

                      backgroundColor:
                      Colors.white,

                      child: Icon(

                        Icons.person,

                        size: 50,

                        color:
                        Color(0xff1565C0),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(

                      "Sowmith Piriya",

                      style: TextStyle(

                        color: Colors.white,

                        fontSize: 24,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(

                      "+91 8688476315",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(

                      "sowmith@gmail.com",

                      style: TextStyle(

                        color:
                        Colors.white70,

                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              profileOption(

                context,

                Icons.qr_code,

                "My QR Code",

                onTap: () {

                  showDialog(

                    context: context,

                    builder: (context) {

                      return AlertDialog(

                        shape: RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(25),
                        ),

                        title: const Text(

                          "My Payment QR",

                          style: TextStyle(

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        content: Column(

                          mainAxisSize:
                          MainAxisSize.min,

                          children: [

                            Container(

                              padding:
                              const EdgeInsets.all(20),

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
                                        alpha: 0.05),

                                    blurRadius: 10,
                                  ),
                                ],
                              ),

                              child: const Icon(

                                Icons.qr_code_2,

                                size: 180,

                                color:
                                Color(0xff1565C0),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(

                              "UPI ID: sowmith@finpay",

                              style: TextStyle(

                                fontSize: 18,

                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(

                              "Scan to send money",

                              style: TextStyle(
                                color: Colors.grey,
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
              ),

              profileOption(
                context,
                Icons.lock,
                "Privacy & Security",
              ),

              profileOption(
                context,
                Icons.notifications,
                "Notifications",
              ),

              profileOption(
                context,
                Icons.help,
                "Help & Support",
              ),

              profileOption(
                context,
                Icons.settings,
                "Settings",
              ),

              profileOption(
                context,
                Icons.logout,
                "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileOption(

      BuildContext context,

      IconData icon,

      String title, {

        VoidCallback? onTap,
      }) {

    return GestureDetector(

      onTap: onTap,

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

              backgroundColor:
              const Color(0xffE3F2FD),

              child: Icon(

                icon,

                color:
                const Color(
                    0xff1565C0),
              ),
            ),

            const SizedBox(width: 15),

            Expanded(

              child: Text(

                title,

                style: const TextStyle(

                  fontSize: 18,

                  fontWeight:
                  FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}