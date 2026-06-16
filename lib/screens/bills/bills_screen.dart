import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor:
        const Color(0xff1565C0),

        title: const Text(

          "Bills",

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

            billTile(
              Icons.lightbulb,
              "Electricity Bill",
              "₹1,250",
            ),

            billTile(
              Icons.wifi,
              "Broadband",
              "₹899",
            ),

            billTile(
              Icons.local_gas_station,
              "Gas Bill",
              "₹650",
            ),

            billTile(
              Icons.water_drop,
              "Water Bill",
              "₹400",
            ),
          ],
        ),
      ),
    );
  }

  Widget billTile(
      IconData icon,
      String title,
      String amount,
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

        leading: CircleAvatar(

          backgroundColor:
          const Color(0xffE3F2FD),

          child: Icon(

            icon,

            color:
            const Color(0xff1565C0),
          ),
        ),

        title: Text(title),

        subtitle:
        const Text("Due Soon"),

        trailing: Text(

          amount,

          style: const TextStyle(

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}