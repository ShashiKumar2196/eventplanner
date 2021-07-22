import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateEventController extends GetxController {
  final FirebaseApp? app;

  CreateEventController({this.app});

  RxInt count =0.obs;

  final refDataBase = FirebaseDatabase.instance;

  DateTime selectedDate = DateTime.now();

  TextEditingController eventNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateSelected = TextEditingController();


  Future<void> createEventDataPost(
      String eventNameController, String descriptionController, String dateSelected,String imageUrl,String count) async {
    try {
      var data = await refDataBase.reference().child("Events List").push().set({
        'Event name': eventNameController,
        'Event Description': descriptionController,
        'Event Date': dateSelected,
        'Event Attending': count,
        'Event Image' : imageUrl.isNull? '-':imageUrl
      }).asStream();
      Get.snackbar("Event Successfully Posted", "",snackPosition:SnackPosition.BOTTOM );
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Something went wrong", "",snackPosition:SnackPosition.BOTTOM );
    }
  }



  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
      selectedDate = picked!;
    dateSelected.text = DateFormat("yyyy-MM-dd hh:mm:ss").format(selectedDate);
    print('Selected Date $dateSelected');
  }

  void eventBook(){
    Get.snackbar('Event Booked Successfully', '',snackPosition:SnackPosition.BOTTOM );
  }

}
