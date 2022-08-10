import 'package:flutter/cupertino.dart';

class VerifiedEmployeeDataViewModel with ChangeNotifier{

  int? teamId;

  setTeamId(int teamId){
    this.teamId=teamId;
    notifyListeners();
  }

}