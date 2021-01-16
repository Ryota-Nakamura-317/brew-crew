class BrewCrewUser {
  //ユーザー情報を引っ張ってくるだけのクラス
  //uidを既に持っているかどうかを判断する材料
  final String uid;

  BrewCrewUser({this.uid});
}

class UserData {
  //以下の情報全てを連携させる
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.sugars, this.strength});
}
