import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
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
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                //decorationプロパティ
                //textInputDecorationを別で定義して呼び出す形にすれば、他でコピペが簡単にできる
                //.copyWith(hintText: 'Email')をつけることでtextInputDecorationに対してhintTextをそれぞれに定義できる
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                //①入力フォーム内の表示文字とその判断
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                //constants.dartより持ってくる
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                //②入力フォーム内の表示文字とその判断,六文字以上のパスワードの作成
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                  //上の①②を判断し、どちらともnullであればtrueとなり、処理が実行される
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
