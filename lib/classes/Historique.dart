import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';


class TimePlace {
  Geolocator _location;
  DateTime _date;

}

class Historique{
  final Firestore _firestore = Firestore.instance;
  Map<String,List<TimePlace>> _historique;
  Duration _duration;
  Historique()
  {
    _historique = new Map<String,List<TimePlace>>();
    _duration = new Duration(hours:0, minutes:5, seconds:0);
  }
  void addLocation(String id,String groupe,TimePlace location) async
  {
    if(_historique.containsKey(groupe)) //Si l'historique visible par le groupe existe deja
      {
        _historique.update(groupe, (v) { //Updating the value relative to groupe
            v.add(location); // On ajoute la location a l'historique
            return v;
        });
        //Ajouter une doc de location au collection  relative a ce grp dans l'historique
        _firestore.collection('users').document(id).collection('historique')
            .document(groupe).collection('location').add({
                  'Time':location._date,
                  'Location' : location._location,
        });
      }
    else
    {
      //On ajoute une nouvelle entrée
      List<TimePlace> v = new List<TimePlace>();
      v.add(location);
      _historique.putIfAbsent(groupe,() => v);
      //Ajouter un collection de location pour ce grp
      _firestore.collection('users').document(id).collection('historique')
          .document(groupe).collection('location').add({
        'Time':location._date,
        'Location' : location._location,
      });
    }
  }
  void supprimerGroupe(String groupe)
  {
    _historique.remove(groupe);
  }
  void supprimer()
  {
    _historique.clear();
  }
}