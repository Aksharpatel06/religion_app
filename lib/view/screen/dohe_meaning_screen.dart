import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'as launcher;


class DoheMeaningScreen extends StatelessWidget {
  const DoheMeaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange,
                        blurRadius: 15
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('संत पीपा के दोहे',style: TextStyle(fontSize: 20,color: Colors.orange,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(child: Text('',style: TextStyle(color: Colors.black,fontSize: 20),maxLines: 3,textAlign: TextAlign.center,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('અર્થ',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    Expanded(child: Text('उठ भाग्यो वाराणसी, न्हायो गंग हजार।पीपा वे जन उत्तम घणा, जिण राम कयो इकबार॥ ',style: TextStyle(color: Colors.black,fontSize: 20),maxLines: 3,textAlign: TextAlign.center,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            Uri url = Uri.parse('https://www.whatsapp.com/');
                            launcher.launchUrl(url);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/image/whatsapp.png'))
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border),
                        ),
                        InkWell(
                          onTap: ()
                          {

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.messenger_outline),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
