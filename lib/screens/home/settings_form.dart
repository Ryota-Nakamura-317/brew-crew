import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          //以下、3つの入力フォームの作成
          //名前
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdownメニュー
          DropdownButtonFormField(
            decoration: textInputDecoration,
            //dropdownメニューに初期表示させる
            value: _currentSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          //slider
          Slider(
            //このスライダー自体はdouble型なので.toDoubleが必要。
            value: (_currentStrength ?? 100).toDouble(),
            //数値に合わせて色の変更の設定
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(
              //roundをつけることでdoubleの指定が不必要となる。
              () => _currentStrength = val.round(),
            ),
          ),
          //updateボタンの作成
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
          ),
        ],
      ),
    );
  }
}
