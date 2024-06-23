import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/helper/api_sarvice.dart';

PopupMenuButton<String> popupButton(BuildContext context) {
  return PopupMenuButton<String>(
    onSelected: (String result) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to change the language?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Provider.of<ApiSarvice>(context, listen: false)
                          .changeLanguage(name: result);
                      Navigator.pop(context);
                    },
                    child: const Text('Yes')),
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
        const PopupMenuItem(
          value: 'meaning',
          child: Text('Hindi'),
        ),
        const PopupMenuItem(
          value: 'gujarati',
          child: Text('Gujarati'),
        ),
        const PopupMenuItem(
          value: 'english',
          child: Text('English'),
        ),
      ];
    },
  );
}
