import 'package:flutter/material.dart';

import 'componects/author_details.dart';
import 'componects/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final weight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      drawer: Drawer(
        width: weight * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              autherDetails(height, weight),
              settings(height, context),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onCanceled: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('You are change this language ?'),
                      actions: [
                        TextButton(onPressed: () {}, child: const Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'))
                      ],
                    );
                  });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Hindi')),
                const PopupMenuItem(child: Text('Gujarati')),
                const PopupMenuItem(child: Text('English')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
