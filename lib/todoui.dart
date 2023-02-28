import 'package:flutter/material.dart';

class TodoUi extends StatefulWidget {
  const TodoUi({Key? key}) : super(key: key);

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter task'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Add task to the list
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTaskCard(String task) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            task,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          trailing: Checkbox(
            // TODO: Implement checkbox functionality
            value: false,
            onChanged: (bool? value) {
              // TODO: Handle checkbox value change
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAlertDialog,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTaskCard('Record A Video'),
            _buildTaskCard('Go To Sleep'),
            _buildTaskCard('Record SQFLITE\nVideo\nInsert\nQuery\nDelete'),
            _buildTaskCard('Buy Groceries\nMilk\nCorn\nMushroom\nRice'),
          ],
        ),
      ),
    );
  }
}