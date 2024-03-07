import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0; // Changed to private _count for encapsulation

 // Getter to access the count

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
