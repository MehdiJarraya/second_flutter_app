import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  // UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: "new Shoes",
      amount: 70.22,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: "Restaurant",
      amount: 100.50,
      date: DateTime.now(),
    )
  ];

  void _addTranscation(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTranscation),
        TransactionList(_userTransactions),
      ],
    );
  }
}
