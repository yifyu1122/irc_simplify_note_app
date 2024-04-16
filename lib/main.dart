import 'package:flutter/material.dart';
import 'package:irc_simplify_note_app/view/home_page.dart';

void main()=>runApp(const IrcSimplifiedNoteApp());

class IrcSimplifiedNoteApp extends StatelessWidget {
  const IrcSimplifiedNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
