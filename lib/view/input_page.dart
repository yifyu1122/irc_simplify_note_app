import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: titleController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Title...',
                    hintStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                ),
                TextField(
                  controller: contentController,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  maxLines: 30,
                  decoration: InputDecoration(
                    hintText: 'Content...',
                    hintStyle: TextStyle(fontSize: 30, color: Colors.white60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pop(context,[titleController.text,contentController.text]);
        },
        icon: Icon(
          Icons.save,
          size: 40,
        ),
      ),
    );
  }
}
