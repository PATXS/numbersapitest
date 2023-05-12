import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  var current = "";
  var fact = "This number is a number.";
  void getNew(int setting) {
    //current = rand.nextInt(2023);
    var extra = "";
    if(setting == 1) extra = "/math";
    if(setting == 2) extra = "/year";
    http.get(
      Uri.parse('http://numbersapi.com/random$extra'),
    ).then((resp) {
      //print(resp.body.toString());
      fact = resp.body.toString();
      current = fact.split(' ')[0];
      notifyListeners();
    });
    //notifyListeners();
  }
}
