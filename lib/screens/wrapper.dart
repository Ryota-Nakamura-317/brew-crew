import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider経由でBrewCrewUserを引っ張ってくる
    //ここで定義した内容を元に、以下のif文でauthかhomeのどちらに画面遷移するか判断

    final user = Provider.of<BrewCrewUser>(context);

    //return either Home or Authenticate widget
    //もしユーザー情報がなければ
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
