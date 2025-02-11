import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Search",
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        children: [
          CupertinoSearchTextField(),
        ],
      ),
    );
  }
}
