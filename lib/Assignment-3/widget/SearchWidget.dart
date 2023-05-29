import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: const Row(
        children: <Widget>[
          Icon(Icons.search),
          SizedBox(width: 8,),
          Flexible(
            child: TextField(
              decoration: InputDecoration(hintText: "Search City",border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
