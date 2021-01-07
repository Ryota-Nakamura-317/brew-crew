import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider経由でBrewCrewUserを引っ張ってくる
    final user = Provider.of<BrewCrewUser>(context);
    print(user);

    //return either Home or Authenticate widget
    return Authenticate();
  }
}
