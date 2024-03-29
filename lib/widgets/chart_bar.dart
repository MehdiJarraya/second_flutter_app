import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return
        // LayoutBuilder give information about  constraint ( width and height ) of this widget
        // if they are defined in the parent or the default widget height and width
        LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          // FittedBox  child ccan't grow mayfoutech available space  when it is text tgueddou zeda ;) shrink the text
          Container(
            height: constraints.maxHeight * 0.1,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.15,
          ),
          Container(
            height: constraints.maxHeight * 0.5,
            width: 10,
            //Stack print element in Z axes => usefull for background
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  // heightFactor accept value from 0 -> 1 (100% of parent height),
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
