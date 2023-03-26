// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_admin_project/business_logics/add_data.dart';
import 'package:fitness_admin_project/ui/views/category.dart';
import 'package:fitness_admin_project/ui/widgets/customeButton.dart';
import 'package:fitness_admin_project/ui/widgets/custome_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({Key? key}) : super(key: key);

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _typeController = TextEditingController(text: "Video");
  TextEditingController _imgController = TextEditingController();
  TextEditingController _thumbnailController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  RxString category = 'video'.obs;
  RxInt allValue = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Fitness Admin App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Obx(
            () => Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ToggleSwitch(
                    activeBgColor: [Colors.purple],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[300],
                    inactiveFgColor: Colors.grey[900],
                    initialLabelIndex: allValue.value,
                    totalSwitches: 3,
                    labels: ['Video', 'Blog', 'Podcast'],
                    onToggle: (index) {
                      index == 0
                          ? category.value = 'video'
                          : index == 1
                              ? category.value = 'blog'
                              : category.value = 'podcast';
                      allValue.value = index!;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                (allValue.value == 0)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customFormField(TextInputType.text, _titleController,
                              context, "Title", (val) {}),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            controller: _descriptionController,
                            validator: (val) {},
                            minLines: 3,
                            maxLines: 6,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(15, 15, 20, 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                              ),
                              hintText: "Description",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customFormField(
                            TextInputType.text,
                            _designationController,
                            context,
                            "Designation",
                            (val) {},
                          ),
                          customFormField(
                            TextInputType.text,
                            _typeController,
                            context,
                            "Type",
                            (val) {},
                            readOnly: true,
                          ),
                          customFormField(TextInputType.text, _imgController,
                              context, "url Link", (val) {}),
                          customFormField(
                              TextInputType.text,
                              _thumbnailController,
                              context,
                              "thumbnail Link",
                              (val) {}),
                          customFormField(
                              TextInputType.text,
                              _categoryController,
                              context,
                              "category",
                              (val) {}),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customeButton("No", () {}),
                              customeButton("Save Data", () {
                                addData().adminDataAdd(
                                  _titleController.text.toString(),
                                  _descriptionController.text.toString(),
                                  _designationController.text.toString(),
                                  _typeController.text.toString(),
                                  _imgController.text.toString(),
                                  _thumbnailController.text.toString(),
                                  _categoryController.text.toString(),
                                  DateTime.now(),
                                );
                              }),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CategoryItem()));
                            },
                            child: Text("Category"),
                          ),
                        ],
                      )
                    : (allValue.value == 1)
                        ? Container(
                            height: 100,
                            width: 100,
                            color: Colors.amber,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            color: Colors.green,
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
