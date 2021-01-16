import 'package:brew_crew/model/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              //SettingForm()は別定義
              child: SettingForm(),
            );
          });
    }

    //StreamProviderで囲む
    //valueはDatabaseService().brewsを聞く
    //Scaffold以下でStreamProviderが適応される
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          //appbar内にアクションボタンを置く
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            //セッティングボタンの表示
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              //ボタンを押した際の出てくるページは_showSettingsPanel()で定義。
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
