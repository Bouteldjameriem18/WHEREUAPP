import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_2cp/servises/auth.dart';
//Inscription
class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String nom = 'Benhamadi' ;
  String prenom = 'Yasmine';
  String email = 'yasminebenhamadi0555@gmail.com';
  String password = 'HeLlO123';
  final ServicesAuth _authService = ServicesAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('sign up with email and password'),
      ),
      body: Container(
        child : RaisedButton(
            child: Text('Sign up'),
            onPressed: () async {
              dynamic result = await _authService.registerEmail(email,password,nom,prenom);
              if (result == null)
                print('Registration failed');
              else
                print('Signned up');
            }
        ),
      ),

    );
  }
}