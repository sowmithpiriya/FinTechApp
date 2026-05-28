import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Transactions"),
      ),

      body: ListView(

        children: const [

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),

            title: Text("Received from Rahul"),
            subtitle: Text("Today, 10:30 AM"),

            trailing: Text(
              "+ ₹500",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),

            title: Text("Paid to Shop"),
            subtitle: Text("Yesterday, 8:15 PM"),

            trailing: Text(
              "- ₹250",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),

            title: Text("Cashback Received"),
            subtitle: Text("Yesterday, 6:00 PM"),

            trailing: Text(
              "+ ₹50",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}