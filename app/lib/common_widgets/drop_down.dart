import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key? key, this.labelColor, required this.speciesList, this.itemValue, required this.label, required this.onChange, this.pBottom, this.labelTextSize}) : super(key: key);
  List<String> speciesList;
  String? itemValue;
  String label;
  var onChange;
  double? pBottom;
  double? labelTextSize;
  Color? labelColor;

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = 10;
    double paddingBottom = 30;
    Color labelColor = Colors.white;

    return Container(
      padding: EdgeInsets.only(top: paddingTop, bottom: widget.pBottom ?? paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 10),
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.labelColor ?? labelColor,
                fontSize: widget.labelTextSize ?? 20,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.transparent),
              color: Colors.white,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.itemValue,
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                iconSize: 36.0,
                items: widget.speciesList.map(buildMenuItem).toList(),
                onChanged: widget.onChange,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
    ),
  );
}