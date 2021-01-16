import 'package:brew_crew/model/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    //streambuilderとは別の方法
    //database.dart内のist<Brew>をリッスンしてbrewsを定義
    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        //リストのUIはBrewTileで別定義
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
