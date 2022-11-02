import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  ListCard({Key? key, required this.items, required this.index}) : super(key: key);
  var items;
  int index;

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.items[widget.index]['name'],
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: AppConstants().cardTitleColor
                  ),
                ),
                Text(
                  'Unit Price : ${widget.items[widget.index]['unitPrice']}',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: AppConstants().cardDataColor
                  ),
                ),
                Text(
                  'Unit Type : ${widget.items[widget.index]['unitType']}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: AppConstants().cardDataColor
                  ),
                ),
              ],
            ),
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: AppConstants().cardTitleColor,
                  size: 40,
                ),
                onPressed: (){
                  context.router.push(OrderRoute(itemID: widget.items[widget.index]['_id']));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
