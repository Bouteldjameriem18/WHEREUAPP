import 'package:geolocator/geolocator.dart';
import 'package:projet_2cp/classes/Discussion.dart';
import 'package:projet_2cp/classes/Utilisateur.dart';

class Groupe{
  String _nom;
  String _id;
  Geolocator _lieuArrive;
  DateTime _dateDepart;
  Discussion _discussion;
  Utilisateur _admin;
  TypeGroupe type;
}

enum TypeGroupe {
  Family,Friends,Work,Other
}