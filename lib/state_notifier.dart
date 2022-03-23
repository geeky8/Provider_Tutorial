import 'package:flutter/cupertino.dart';
import 'package:internship/state_enum.dart';
import 'package:internship/user_model.dart';

class StateNotifier extends ChangeNotifier {
  ScreenState state = ScreenState.PROFILE;
  UserModel userModel = UserModel(
    name: 'Parth',
    phoneNo: '99999999',
    board: 'CBSE',
    city: 'Mumbai',
    country: 'India',
    email: 'abc@gmail.com',
    gender: 'Female',
    grade: '8',
    parentEmail: '123@gmail.com',
    whatAmIDoing: 'studying',
  );

  StateNotifier();

  void changeState({required ScreenState currentState}) {
    switch (currentState) {
      case ScreenState.PROFILE:
        state = ScreenState.EDIT;
        break;
      case ScreenState.EDIT:
        state = ScreenState.PROFILE;
        break;
    }

    notifyListeners();
  }

  void updateModel({required UserModel model}) {
    userModel = model;
    changeState(currentState: state);
    notifyListeners();
  }
}
