import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/theme_provider.dart';

Column settings(double height, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(),
      SizedBox(
        height: height * 0.015,
      ),
      const Text('Settings :',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
      ),),
      SizedBox(
        height: height * 0.015,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(!Provider.of<ThemeProvider>(context).isThemeDark
                  ? Icons.sunny
                  : Icons.dark_mode),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Theme :',
                style: TextStyle(fontSize: 21),
              ),
            ],
          ),
          Switch(
            value: Provider.of<ThemeProvider>(context).isThemeDark,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .changeTheme(value);
            },
          )
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      const Row(
        children: [
          Icon(Icons.info),
          SizedBox(
            width: 15,
          ),
          Text(
            'About',
            style: TextStyle(fontSize: 21),
          ),
        ],
      ),
    ],
  );
}
