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

  //get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
