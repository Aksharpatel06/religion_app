import 'package:flutter/material.dart';

Column autherDetails(double height, double weight) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: height * 0.03,
      ),
      const Text('Author Details :',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
      ),),
      SizedBox(
        height: height * 0.02,
      ),
      const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('asset/img/person/Boy.jfif'),
          radius: 65,
        ),
      ),
      SizedBox(
        height: height * 0.02,
      ),

      Row(
        children: [
          const Icon(Icons.person),
          SizedBox(
            width: weight * 0.015,
          ),
          const Text(
            'Mohan',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      SizedBox(
        height: height * 0.02,
      ),
      Row(
        children: [
          const Icon(Icons.location_on),
          SizedBox(
            width: weight * 0.015,
          ),
          const Text(
            'मंदसौर, मध्य प्रदेश',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      SizedBox(
        height: height * 0.015,
      ),
      Row(
        children: [
          const Icon(Icons.calendar_month),
          SizedBox(
            width: weight * 0.015,
          ),
          const Text(
            '1880 - 1967',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      SizedBox(
        height: height * 0.015,
      ),
      Row(
        children: [
          const Icon(Icons.add_box_outlined),
          SizedBox(
            width: weight * 0.015,
          ),
          SizedBox(
            width: weight*0.24,
            child: const Text(
              'सीतामऊ नरेश। वास्तविक नाम रामसिंह। काव्य-भाषा ब्रजी।',
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    ],
  );
}
