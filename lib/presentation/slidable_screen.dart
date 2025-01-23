import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableScreen extends StatefulWidget {
  const SlidableScreen({super.key});

  @override
  State<SlidableScreen> createState() => _SlidableScreenState();
}

class _SlidableScreenState extends State<SlidableScreen> {
  final List<Map<String, String>> people = [
    {'name': 'Chetan Kumar', 'role': 'Flutter Developer'},
    {'name': 'Suhail', 'role': 'CEO of Google'},
    {'name': 'Mahesha', 'role': 'Backend Developer'},
    {'name': 'Vikas Gupta', 'role': 'QA Tester'},
    {'name': 'Aarti Sharma', 'role': 'UI/UX Designer'},
    {'name': 'Rohit Singh', 'role': 'Backend Developer'},
    {'name': 'Neha Verma', 'role': 'Project Manager'},
    {'name': 'Vikas Gupta', 'role': 'QA Tester'},
    {'name': 'Sneha', 'role': 'Project Manager'},
  ];

  void _deleteItem(int index) {
    setState(() {
      people.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted ${people[index]['name']}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50, // Light purple background
      appBar: AppBar(
        title: const Text('Team Members'),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
        elevation: 4,
        toolbarHeight: 100, // Increased AppBar height
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return Slidable(
            key: ValueKey(person['name']),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () => _deleteItem(index),
              ),
              children: [
                SlidableAction(
                  onPressed: (_) => _deleteItem(index),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (_) => print('Shared ${person['name']}'),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) => print('Archived ${person['name']}'),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: (_) => print('Saved ${person['name']}'),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.purple.shade300,
                  child: Text(
                    person['name']![0], // First letter of the name
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                title: Text(
                  person['name']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade800,
                  ),
                ),
                subtitle: Text(
                  person['role']!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
                onTap: () {
                  print('Tapped on ${person['name']}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
