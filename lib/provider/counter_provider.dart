import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0; // Changed to private _count for encapsulation

  int get count => _count; // Getter to access the count

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
