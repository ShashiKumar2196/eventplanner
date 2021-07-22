import 'package:eventplanner/controllers/create_event_controller.dart';
import 'package:eventplanner/controllers/image_picking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final CreateEventController createEventController =
      Get.put(CreateEventController());
  final ImagePickController imagePickController =
      Get.put(ImagePickController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Create Event'),
        centerTitle: true,
      ),
      body: Container(
        height: 550,
        child: SingleChildScrollView(
          child: Card(
            semanticContainer: true,
            margin: EdgeInsets.only(right: 25, left: 25, top: 25),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.teal[100],
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Event Name'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: createEventController.eventNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: new BorderSide(
                                color: Colors.teal,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Event Name",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date & Time'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onTap: () {
                          createEventController.selectDate(context);
                        },
                        onSaved: (val) {
                          createEventController.dateSelected.text = val!;
                        },
                        controller: createEventController.dateSelected,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: new BorderSide(
                                color: Colors.teal,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Select",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add Description'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 125,
                        child: TextFormField(
                          controller:
                              createEventController.descriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: new BorderSide(
                                  color: Colors.teal,
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Description here",
                          ),
                          maxLines: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 5,
                  ),
                  onPressed: () {
                    imagePickController.pickImage();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Post'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 5,
                  ),
                  onPressed: () {
                    createEventController.createEventDataPost(
                      createEventController.eventNameController.text,
                      createEventController.descriptionController.text,
                      createEventController.dateSelected.text,
                      imagePickController.imageUrl.toString(),
                      createEventController.count.toString(),
                    );
                    print('Pressed');
                    createEventController.eventNameController.clear();
                    createEventController.descriptionController.clear();
                    createEventController.dateSelected.clear();
                    imagePickController.imageUrl = null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
