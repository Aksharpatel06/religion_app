import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:religion_app/view/modal/dohe_modal.dart';

class ApiSarvice extends ChangeNotifier {
  List<DoheModal> modalList = [];
  List<String> language = [];
  List<DoheModal> favoriteDohe=[];
  String name = "meaning";

  ApiSarvice() {
    getData();
  }

  Future<void> getData() async {
    String apiData = await rootBundle.loadString('asset/json/dohe.json');
    List jsonList = jsonDecode(apiData);
    modalList = jsonList.map((e) => DoheModal.fromJson(e)).toList();
    notifyListeners();
  }

  void changeLanguage({required String name}) {
    this.name = name;
    if(this.name=='meaning')
    {
      language.clear();
      modalList.forEach((doheModal) {
        language.add(doheModal.meaning);
      });
    } else if(this.name=='gujarati')
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

  void favoriteDhohe(int index)
  {
    modalList[index].islike =!modalList[index].islike;
    if(modalList[index].islike)
      {
        favoriteDohe.add(modalList[index]);
      }else{
      favoriteDohe.remove(modalList[index]);
    }
    notifyListeners();
  }
}

