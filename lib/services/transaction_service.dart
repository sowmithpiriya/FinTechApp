class TransactionService {

  static List<Map<String, dynamic>>
  transactions = [];

  static Future<void> addTransaction({

    required String title,
    required String amount,

  }) async {

    transactions.add({

      "title": title,
      "amount": amount,
    });
  }
}