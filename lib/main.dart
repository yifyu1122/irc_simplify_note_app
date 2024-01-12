import 'package:flutter/material.dart';
import 'package:irc_simplify_note_app/view/home_page.dart';

void main()=>runApp(IrcSimplifiedNoteApp());

class IrcSimplifiedNoteApp extends StatelessWidget {
  const IrcSimplifiedNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
