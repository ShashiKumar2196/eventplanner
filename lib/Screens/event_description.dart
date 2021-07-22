import 'package:eventplanner/controllers/create_event_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDescription extends StatelessWidget {
  final String? eventName;
  final String? eventDescription;
  final String? eventDateTime;
  final String? eventImageUrl;
  final String? eventAttending;

  EventDescription(
      {this.eventName,
      this.eventDescription,
      this.eventDateTime,
      this.eventImageUrl,
      this.eventAttending});

  final CreateEventController createEventController =
      Get.put(CreateEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                    image: NetworkImage(eventImageUrl =="null"?
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg':eventImageUrl.toString()),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 170, left: 20),
                child: Text(
                  eventName!,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: Text('Posted On : $eventDateTime'),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Description',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Text(eventDescription!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Book Event'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                elevation: 3,
              ),
              onPressed: () {
                createEventController.eventBook();
              },
            )
          ],
        ),
      ),
    );
  }
}
