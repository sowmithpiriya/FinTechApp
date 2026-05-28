import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Financial Services",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: ListView(

        children: const [

          ListTile(
            leading: Icon(Icons.money),
            title: Text("Personal Loan"),
          ),

          ListTile(
            leading:
            Icon(Icons.diamond),
            title: Text("Gold Loan"),
          ),

          ListTile(
            leading:
            Icon(Icons.trending_up),
            title:
            Text("Mutual Funds"),
          ),

          ListTile(
            leading:
            Icon(Icons.directions_car),
            title:
            Text("Vehicle Loan"),
          ),

          ListTile(
            leading:
            Icon(Icons.home),
            title:
            Text("Home Loan"),
          ),
        ],
      ),
    );
  }
}