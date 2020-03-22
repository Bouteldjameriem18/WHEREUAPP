import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_2cp/classes/Alerte.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';

class FirestoreService{

  final Firestore _firestore = Firestore.instance;
  Future<Utilisateur> getUserDoc(String id) async
  {
    await _firestore.collection("users").document(id).get().then((userData){
      if(userData.exists)
        {
          userData.data;
        }
      else 
        {
          print('Couldn\'t find user\'s data');
        }
    }).catchError((error){
      print('Something went wrong'+error.toString());
    });
    
    return null;
  }

  Future createGroup(String nom/*members,admin,type*/) async
  {
    DocumentReference groupDoc = await _firestore.collection("Groupes")
        .add({
      //'title': 'Flutter in Action',
      //'description': 'Complete Programming Guide to learn Flutter'
    });
    print(groupDoc.documentID);
  }
}