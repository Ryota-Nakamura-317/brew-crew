import 'package:brew_crew/model/brew.dart';
import 'package:brew_crew/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  //この時点ではデータベース常にbrewsのフォルダを作成する必要なし
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  //サインアップの時にデータを作る、データのアップデートの2回で使用
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      //3つのプロパティをdocumentの中に作成する。
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list form snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()['name'] ?? '',
        sugars: doc.data()['sugars'] ?? 0,
        strength: doc.data()['strength'] ?? '0',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
    );
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream ユーザー情報とドキュメントを連携させる
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
