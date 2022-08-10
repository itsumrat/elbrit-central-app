

import 'package:flutter/cupertino.dart';

class GlobalData with ChangeNotifier{
  var id;
  setId(var id){
    id=id;
    notifyListeners();
  }
}