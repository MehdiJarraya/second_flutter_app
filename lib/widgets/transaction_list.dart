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
                // SizedBox is usefull to define height
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
                  child: Row(
                    children: <Widget>[
                      // to wrap a text we need a container because it is resisable
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Text(
                            // string interpolation is a better in dart for concatting string better of using +
                            //+++ with string interpolation we don't need to use toString() to convert any variable to string before concatting
                            // $variable or ${nestedvariable}
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            )),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            // style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 16,
                            // ),
                            // use  global textTheme
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            // DateFormat('yyyy-MM-dd') with pattern
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
