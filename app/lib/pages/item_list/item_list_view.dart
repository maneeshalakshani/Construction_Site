import 'package:app/constants.dart';
import 'package:app/pages/item_list/list_card.dart';
import 'package:app/services/item_list_services.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  var items;
  var itemLength;

  void getListData(){
    ItemListServices().getAllItems().then((val) async {
      setState(() {
        items = val.data['Result'];
        itemLength = val.data['Result'].length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    getListData();

    if(itemLength == 0 ||itemLength == null){
      return const Center(
        child: Text(
          'Loading...'
        ),
      );
    }else{
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppConstants().insideBackgroundColor,
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index){
              return ListCard(items: items, index: index);
            },
          ),
        ),
      );
    }
  }
}
