import 'package:flutter/material.dart';
import '/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        // primarySwatch provide the variation of colors
        primarySwatch: Colors.purple,
        // accentColor looke for docs to see which color much with purple
        accentColor: Colors.amber,
        // match the name with yaml file
        fontFamily: 'Quicksand',
        // define global textTheme
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        // overrride all appBar  title with those style bellow
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              // define global variable theme style
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              // define global variable theme style
              button: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
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

// work only with recent last week transaction
  List<Transaction> get _recentTransctions {
    // where === filter  in js
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTranscation(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
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
        title: Text(
          'Personal Expences',
          // unstead we define app bar style here we override in theme above
          // style: TextStyle(fontFamily: 'OpenSans'),
        ),
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
                child: Chart(_recentTransctions),
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
