import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religion_app/view/helper/api_sarvice.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class DoheMeaningScreen extends StatelessWidget {
  final int index;

  DoheMeaningScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
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
          ),
        ],
      ),
      body: Consumer<ApiSarvice>(
        builder: (context, apiSarvice, child) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                boxShadow: [const BoxShadow(color: Colors.orange, blurRadius: 15)],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                  Expanded(
                      child: Text(
                        apiSarvice.modalList[index].hindi,
                        style: const TextStyle(color: Colors.black, fontSize: 20),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'अर्थ',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${apiSarvice.language[index]}",
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Uri url = Uri.parse('https://www.whatsapp.com/');
                          launcher.launchUrl(url);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/whatsapp.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.share),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.messenger_outline),
                      ),
                    ],
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
