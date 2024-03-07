import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier {
  double value = 0;

  String? fullName ;

  void setValue(double val) {
    value = val;
    notifyListeners();
  }

  void setFullName(String fName, String lName) {
    fullName = '$fName $lName';
  }
}
