

import 'package:flutter/cupertino.dart';

class NumbersListProvider extends ChangeNotifier{
  List<int> numbers = [1,2,3,4];


  void add(){
    int last = numbers.last;
    numbers.add(last+1);
    notifyListeners();
    //notify listeners help to tell the widgets in which condsumer is used
    //that some changes has been made
  }
}