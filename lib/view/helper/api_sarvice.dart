import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:religion_app/view/modal/dohe_modal.dart';

class ApiSarvice extends ChangeNotifier{
  List<DoheModal> modalList =[];

  ApiSarvice()
  {
    getData();
  }

  Future<void> getData()
  async {
    String? apiData = await rootBundle.loadString('asset/json/dohe.json');
    List jsonList = jsonDecode(apiData);
    print(jsonList);
    modalList = jsonList.map((e) => DoheModal.fromJson(e),).toList();
    notifyListeners();
  }
}