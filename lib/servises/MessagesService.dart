import 'package:flutter/material.dart';

@immutable

class MessagesService {


  final String title;
  final String body;

  const MessagesService ( {

     @required this.title,
     @required this.body,

});

}