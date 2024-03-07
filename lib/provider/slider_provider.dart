import 'package:flutter/foundation.dart';

class SliderProvider extends ChangeNotifier {
  double value = 0;

  void setValue(double val) {
    value = val;
    notifyListeners();
  }
}
