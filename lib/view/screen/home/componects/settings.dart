import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';

Column settings(double height, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Divider(),
      SizedBox(
        height: height * 0.015,
      ),
      Text('Settings :',style: TextStyle(
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
              SizedBox(
                width: 15,
              ),
              Text(
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
      Row(
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
