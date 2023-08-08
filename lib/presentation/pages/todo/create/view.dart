import 'package:flutter/material.dart';

class TodoCreateView extends StatefulWidget {
  const TodoCreateView({super.key});

  @override
  State<TodoCreateView> createState() => _TodoCreateViewState();
}

class _TodoCreateViewState extends State<TodoCreateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create todo')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // description
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: TextField(
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Detail',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () => {},
                child: Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
