import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Pay Bills",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: ListView(

        children: const [

          ListTile(
            leading:
            Icon(Icons.lightbulb),
            title:
            Text("Electricity Bill"),
            subtitle:
            Text("₹1,200 Pending"),
          ),

          ListTile(
            leading:
            Icon(Icons.local_gas_station),
            title:
            Text("Gas Bill"),
            subtitle:
            Text("₹850 Pending"),
          ),

          ListTile(
            leading:
            Icon(Icons.water_drop),
            title:
            Text("Water Bill"),
            subtitle:
            Text("₹400 Pending"),
          ),

          ListTile(
            leading:
            Icon(Icons.wifi),
            title:
            Text("WiFi Bill"),
            subtitle:
            Text("₹999 Pending"),
          ),
        ],
      ),
    );
  }
}