import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../services/transaction_service.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() =>
      _QRScreenState();
}

class _QRScreenState
    extends State<QRScreen> {

  final TextEditingController amountController =
  TextEditingController();

  String qrData = "";

  void generateQR() {

    if (amountController.text.isNotEmpty) {

      setState(() {

        qrData =
        "upi://pay?pa=finpay@upi&pn=FinPay&am=${amountController.text}";
      });
    }
  }

  void simulatePayment() async {

    await TransactionService.addTransaction(
      title: "QR Payment",
      amount: amountController.text,
    );

    if (!mounted) return;

    showDialog(

      context: context,

      builder: (_) => AlertDialog(

        title: const Text(
          "Payment Successful",
        ),

        content: Text(
          "₹${amountController.text} payment completed.",
        ),

        actions: [

          TextButton(

            onPressed: () {

              Navigator.pop(context);
            },

            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor:
        const Color(0xff5F259F),

        title: const Text(
          "Generate QR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const SizedBox(height: 20),

            TextField(

              controller: amountController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(

                hintText: "Enter Amount",

                prefixIcon:
                const Icon(Icons.currency_rupee),

                filled: true,
                fillColor: Colors.grey.shade100,

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xff5F259F),

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),

                onPressed: generateQR,

                child: const Text(
                  "Generate QR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            if (qrData.isNotEmpty)

              Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                  BorderRadius.circular(25),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(

                  children: [

                    QrImageView(
                      data: qrData,
                      size: 250,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Pay ₹${amountController.text}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(

                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(

                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.green,

                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: simulatePayment,

                        child: const Text(
                          "Simulate Payment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}