class TransactionService {

  static String activeBank =
      "HDFC Bank";

  static String activeAccount =
      "XXXX 4587";

  static String activeBalance =
      "₹25,450";

  static String realBalance =
      "₹25,450";

  static int balanceAmount = 25450;

  // TRANSACTION HISTORY
  static List<Map<String, dynamic>>
  transactions = [

    {
      "title": "Amazon Shopping",
      "amount": "- ₹499",
      "date": "Today",
    },

    {
      "title": "Salary Credit",
      "amount": "+ ₹50,000",
      "date": "Today",
    },
  ];

  static void updateBank({

    required String bank,

    required String account,

    required String balance,
  }) {

    activeBank = bank;

    activeAccount = account;

    activeBalance = balance;

    realBalance = balance;

    balanceAmount =
        int.parse(

          balance
              .replaceAll("₹", "")
              .replaceAll(",", ""),
        );
  }

  static void sendMoney(
      int amount) {

    balanceAmount =
        balanceAmount - amount;

    activeBalance =
    "₹${balanceAmount.toString()}";

    realBalance =
        activeBalance;

    // ADD TO HISTORY
    transactions.insert(0, {

      "title": "UPI Payment",

      "amount": "- ₹$amount",

      "date": "Just Now",
    });
  }
}