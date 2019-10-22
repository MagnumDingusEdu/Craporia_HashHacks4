import 'package:flutter/material.dart';

@immutable
class Message {
  final String title;
  final String body;
  final String crap;

  const Message({
    @required this.title,
    @required this.body,
    @required this.crap,
  });
}
