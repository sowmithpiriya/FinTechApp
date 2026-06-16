import 'package:flutter/material.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        title: const Text(

          "Recharge",

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

            rechargeTile(
              "My Number",
              "+91 8688476315",
            ),

            rechargeTile(
              "Rahul",
              "+91 9999999999",
            ),

            rechargeTile(
              "Anjali",
              "+91 9876543210",
            ),
          ],
        ),
      ),
    );
  }

  Widget rechargeTile(
      String name,
      String number,
      ) {

    return Card(

      margin:
      const EdgeInsets.only(
          bottom: 15),

      child: ListTile(

        leading: const CircleAvatar(

          backgroundColor:
          Color(0xffE3F2FD),

          child: Icon(

            Icons.phone_android,

            color:
            Color(0xff1565C0),
          ),
        ),

        title: Text(name),

        subtitle: Text(number),

        trailing: ElevatedButton(

          style:
          ElevatedButton.styleFrom(

            backgroundColor:
            const Color(0xff1565C0),
          ),

          onPressed: () {},

          child: const Text(

            "Recharge",

            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}