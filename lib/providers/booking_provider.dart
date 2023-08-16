import 'package:e_learning_app/models/class_model.dart';
import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  List<ClassesModel> myClasses = [];

  void addToList(ClassesModel myClass) {
    myClasses.add(myClass);
    notifyListeners();
  }
}
