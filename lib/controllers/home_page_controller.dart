import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  final FirebaseApp? app;

  HomePageController({this.app});

  final refDataBase = FirebaseDatabase.instance;


  @override
  void onInit() {
    getEventData();
  }
  
  void getEventData() async{
    var eventList = await refDataBase.reference().child('Events List');
    print('Event List $eventList');
  }
  
  
}