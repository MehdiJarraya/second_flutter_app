import 'package:flutter/material.dart';
import '/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransactio(BuildContext ctx) {
    // this is flutter method that need context as param so we pass when calling startAddNewTransactio
//
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTranscation);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransactio(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      // column take all available space
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactio(context),
      ),
    );
  }
}
