import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
    /// 初期値
    int currentNumber = 1;

    /// count の更新メソッド
    void updateCurrentNumber() {
        currentNumber ++;
        notifyListeners();
    }
}
