import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            // PROFILE CARD
            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(

                gradient: const LinearGradient(
                  colors: [
                    Color(0xff5F259F),
                    Color(0xff7E57C2),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(25),
              ),

              child: Column(

                children: [

                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xff5F259F),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Sowmith",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "sowmith@upi",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "KYC Verified",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // QR CARD
            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(25),
              ),

              child: Column(

                children: [

                  const Text(
                    "My QR Code",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  QrImageView(
                    data: "upi://pay?pa=sowmith@upi",
                    size: 220,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Scan to Pay Sowmith",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // USER DETAILS
            detailsTile(
              Icons.phone,
              "Phone Number",
              "+91 8688476315",
            ),

            detailsTile(
              Icons.cake,
              "Age",
              "21",
            ),

            detailsTile(
              Icons.person_outline,
              "Gender",
              "Male",
            ),

            detailsTile(
              Icons.account_balance,
              "Bank",
              "HDFC Bank",
            ),

            detailsTile(
              Icons.credit_card,
              "Account Number",
              "XXXX XXXX 4587",
            ),

            detailsTile(
              Icons.location_on,
              "Location",
              "Hyderabad",
            ),

            const SizedBox(height: 20),

            // SETTINGS
            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(25),
              ),

              child: Column(

                children: [

                  settingTile(
                    Icons.security,
                    "Security",
                  ),

                  settingTile(
                    Icons.notifications,
                    "Notifications",
                  ),

                  settingTile(
                    Icons.help,
                    "Help & Support",
                  ),

                  settingTile(
                    Icons.logout,
                    "Logout",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsTile(
      IconData icon,
      String title,
      String value,
      ) {

    return Card(

      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
          const Color(0xffEFE7FF),

          child: Icon(
            icon,
            color: const Color(0xff5F259F),
          ),
        ),

        title: Text(title),

        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget settingTile(
      IconData icon,
      String title,
      ) {

    return ListTile(

      leading: Icon(
        icon,
        color: const Color(0xff5F259F),
      ),

      title: Text(title),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
    );
  }
}