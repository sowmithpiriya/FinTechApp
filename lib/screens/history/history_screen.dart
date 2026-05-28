import 'package:flutter/material.dart';
import '../../services/transaction_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}

class _HistoryScreenState
    extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      padding: const EdgeInsets.all(20),

      itemCount:
      TransactionService
          .transactions.length,

      itemBuilder: (context, index) {

        final transaction =
        TransactionService
            .transactions[index];

        return Card(

          margin:
          const EdgeInsets.only(
              bottom: 15),

          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
                15),
          ),

          child: ListTile(

            leading: const CircleAvatar(

              backgroundColor:
              Color(0xffEFE7FF),

              child: Icon(
                Icons.qr_code,
                color:
                Color(0xff5F259F),
              ),
            ),

            title: Text(
              transaction["title"],
            ),

            subtitle:
            const Text("Today"),

            trailing: Text(

              "₹${transaction["amount"]}",

              style: const TextStyle(
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}