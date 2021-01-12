import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //show toggleView
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //データ呼び出し専用のauth.dartの呼び出し
  //これでAuthServiceがこのクラスでも使用可能となる
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        //elevation； 高さ、影をつける
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        //appbar内のSignInボタン
        actions: [
          FlatButton.icon(
            onPressed: () {
              //toggleViewの値を参照して判断
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
          ),
        ],
      ),
      body: Container(
        //EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0)；縦と横に空白を設定できる。
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(email);
                print(password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
