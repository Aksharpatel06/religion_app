import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:religion_app/view/modal/dohe_modal.dart';

class ApiSarvice extends ChangeNotifier {
  List<DoheModal> modalList = [];
  List<String> language = [];
  String name = "hindi";

  ApiSarvice() {
    getData();
  }

  Future<void> getData() async {
    String apiData = await rootBundle.loadString('asset/json/dohe.json');
    List jsonList = jsonDecode(apiData);
    modalList = jsonList.map((e) => DoheModal.fromJson(e)).toList();
    notifyListeners();
  }

  void changeLanguage({String? name}) {
    if(name=='meaning')
    {
      language.clear();
      modalList.forEach((doheModal) {
        language.add(doheModal.meaning);
      });
    } else if(name=='gujarati')
    {
      language.clear();
      modalList.forEach((doheModal) {
        language.add(doheModal.gujarati);
      });
    } else{
      language.clear();
      modalList.forEach((doheModal) {
        language.add(doheModal.english);
      });
    }

    notifyListeners();
  }

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}

