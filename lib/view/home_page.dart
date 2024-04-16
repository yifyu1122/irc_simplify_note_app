import 'package:flutter/material.dart';
import 'package:irc_simplify_note_app/view/input_page.dart';
import 'package:irc_simplify_note_app/note_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'To Do List',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sort,
                    size: 45,
                  ),
                ),
              ],
            ),
            TextField(
              onChanged: NoteService.searchNote,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for......',
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade400,
                ),
                fillColor: Colors.grey.shade700,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(40),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.transparent)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: NoteService.searchNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: '${NoteService.searchNotes[index].title}\n',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                              children: [
                                TextSpan(
                                  text: '${NoteService.searchNotes[index].content}\n',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            '${NoteService.searchNotes[index].time}',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                NoteService.deleteNote(index);
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          final result = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const InputPage()));
          setState(() {
            if (result != null) {
              NoteService.addNote(result[0], result[1]);
            }
          });

        },
        icon: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
