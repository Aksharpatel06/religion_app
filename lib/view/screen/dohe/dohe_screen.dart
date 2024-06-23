import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:religion_app/view/controller/theme_provider.dart';

import '../../../utils/global_variable.dart';
import '../../controller/helper/api_sarvice.dart';

import '../../controller/image_provider.dart';
import '../componects/pop_up_button.dart';

class DoheScreen extends StatelessWidget {
  DoheScreen(
      {super.key,
      required this.apiSarvice,
      required this.apiSarvicefalse,
      required this.index});

  ApiSarvice apiSarvice;
  ApiSarvice apiSarvicefalse;
  int index;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          popupButton(context),
        ],
      ),
      body: Consumer<ApiSarvice>(
        builder: (context, apiSarvice, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  RepaintBoundary(
                    key: imgKey,
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                        boxShadow: const [
                          BoxShadow(color: Colors.orange, blurRadius: 15)
                        ],
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(Provider.of<ThemeProvider>(context)
                                    .isThemeDark
                                ? 'asset/img/bgImage/dark/image${index % 6}.jfif'
                                : 'asset/img/bgImage/light/image${index % 6}.jfif'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'मोहन के दोहे',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            apiSarvice.modalList[index].hindi,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2),
                            child: Text(
                              'अर्थ',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              apiSarvice.language[index],
                              style: const TextStyle(fontSize: 20),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(vertical: 300.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              apiSarvicefalse.favoriteDhohe(index);
                            },
                            child: apiSarvice.modalList[index].islike
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.favorite_border)),
                        CupertinoButton(
                          onPressed: () {
                            Provider.of<ImagesProvider>(context, listen: false)
                                .copyText(apiSarvice, index, context);
                          },
                          child: const Icon(Icons.copy),
                          padding: EdgeInsets.zero,
                        ),
                        CupertinoButton(
                          onPressed: () async {
                            Provider.of<ImagesProvider>(context, listen: false)
                                .saveImage();
                          },
                          child: const Icon(Icons.save),
                          padding: EdgeInsets.zero,
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            Provider.of<ImagesProvider>(context, listen: false)
                                .shareImage();
                          },
                          child: const Icon(Icons.share),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
