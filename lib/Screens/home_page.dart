import 'package:eventplanner/Screens/create_event.dart';
import 'package:eventplanner/Screens/event_description.dart';
import 'package:eventplanner/controllers/auth_controller.dart';
import 'package:eventplanner/controllers/home_page_controller.dart';
import 'package:eventplanner/controllers/network_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<AuthController>();
  final homePageController = Get.put(HomePageController());
  final NetworkController networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Event Planner'),
        automaticallyImplyLeading: false,
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                controller.signOut();
              },
              child: Text(
                'SignOut',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25, right: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            Get.to(CreateEvent());
          },
          child: Center(child: Text('Add')),
        ),
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        reverse: true,
        query: homePageController.refDataBase.reference().child('Events List'),
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => EventDescription(
                    eventName: snapshot.value['Event name'],
                    eventDateTime: snapshot.value['Event Date'],
                    eventDescription: snapshot.value['Event Description'],
                    eventImageUrl: snapshot.value['Event Image'],
                    eventAttending: snapshot.value['Event Attending'],
                  ));
            },
            child: Container(
              height: 175,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0, // soften the shadow
                  )
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        child: Image.network(
                          snapshot.value['Event Image'] == 'null'
                              ? 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'
                              : snapshot.value['Event Image'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(15),
                        bottomEnd: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${snapshot.value['Event name']}',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                              'Posted On: ${snapshot.value['Event Date'].toString().substring(0, 10)}')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
