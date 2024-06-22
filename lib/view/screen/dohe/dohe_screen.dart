import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religion_app/view/helper/api_sarvice.dart';

class DoheScreen extends StatelessWidget {
  const DoheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiSarvice apiSarvice = Provider.of<ApiSarvice>(context);
    final height = MediaQuery.sizeOf(context).height;
    final weight = MediaQuery.sizeOf(context).height;
    return Scaffold(
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(apiSarvice.modalList.length, (index) {
              return CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/doheMeaning');
                },
                padding: EdgeInsets.zero,
                child: Container(
                  height: height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 5,
                          blurRadius: 2,
                        )
                      ]),
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: Text(
                      apiSarvice.modalList[index].doheId.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      apiSarvice.modalList[index].hindi,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}