import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final contacts = [

      "Rahul",
      "Kiran",
      "Suresh",
      "Anjali",
      "Ravi",
    ];

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Send Money",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: ListView.builder(

        itemCount: contacts.length,

        itemBuilder: (context, index) {

          return ListTile(

            leading: CircleAvatar(

              backgroundColor:
              const Color(0xffEFE7FF),

              child: Text(
                contacts[index][0],
              ),
            ),

            title: Text(
              contacts[index],
            ),

            subtitle:
            const Text("Tap to send"),

            trailing: ElevatedButton(

              onPressed: () {

                ScaffoldMessenger.of(
                    context)
                    .showSnackBar(

                  SnackBar(
                    content: Text(
                      "₹500 sent to ${contacts[index]}",
                    ),
                  ),
                );
              },

              child: const Text("Send"),
            ),
          );
        },
      ),
    );
  }
}