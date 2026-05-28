import 'package:flutter/material.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final users = [

      "My Number",
      "Rahul",
      "Kiran",
      "Anjali",
    ];

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Mobile Recharge",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: ListView.builder(

        itemCount: users.length,

        itemBuilder: (context, index) {

          return ListTile(

            leading: const CircleAvatar(
              child: Icon(Icons.phone),
            ),

            title: Text(users[index]),

            subtitle:
            const Text("Recharge ₹299"),

            trailing: ElevatedButton(

              onPressed: () {

                ScaffoldMessenger.of(
                    context)
                    .showSnackBar(

                  SnackBar(
                    content: Text(
                      "Recharge done for ${users[index]}",
                    ),
                  ),
                );
              },

              child:
              const Text("Recharge"),
            ),
          );
        },
      ),
    );
  }
}