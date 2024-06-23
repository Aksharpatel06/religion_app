import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religion_app/view/screen/dohe/dohe_screen.dart';

import '../../controller/helper/api_sarvice.dart';
import '../componects/pop_up_button.dart';
import 'componects/author_details.dart';
import 'componects/settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiSarvice apiSarvice = Provider.of<ApiSarvice>(context);
    ApiSarvice apiSarvicefalse =
        Provider.of<ApiSarvice>(context, listen: false);

    final height = MediaQuery.sizeOf(context).height;
    final weight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      drawer: Drawer(
        width: weight * 0.35,
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
          popupButton(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              apiSarvice.modalList.length,
              (index) {
                return CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoheScreen(
                        apiSarvicefalse: apiSarvicefalse,
                        apiSarvice: apiSarvice,
                        index: index,
                      ),
                    ));
                    apiSarvice.changeLanguage(name: apiSarvice.name);
                  },
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.5),
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange,
                                    ),
                                    child: Center(
                                        child: Text(
                                      apiSarvice.modalList[index].doheId
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SizedBox(
                                width: weight * 0.35,
                                child: Text(
                                  apiSarvice.modalList[index].hindi,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
