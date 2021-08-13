import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // ListView === column with SingleChildScrollView
      // BUT we have to define height because default ListView is infinite an this will provide an error
      // column height is the full remaining space
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No transaction added Yet!"),
                // SizedBox is usefull to define margin
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  //  we have to define also image in pubspce.yml
                  child: Image.asset(
                    "assets/image/waiting.png",
                    // will not work because if direct parent is column because column has infinti height
                    // we have to wrap it with container
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    // tailing for left icon button like delete
                    // trailing: ,
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
