import 'package:flutter/material.dart';
import 'package:flutter_cl/entities/detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detail});

  final Detail detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail title'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.insert_drive_file),
            title: Text(detail.id ?? '0'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(detail.name),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(detail.email),
          ),
        ],
      ),
    );
  }
}
