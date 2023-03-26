import 'package:fitness_admin_project/ui/views/category.dart';
import 'package:fitness_admin_project/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../business_logics/add_data.dart';
import '../widgets/customeButton.dart';
import '../widgets/custome_form_field.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({super.key});

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
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
      backgroundColor: Color(0xFFDADADA),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFFFCFCFC),
        title: Row(
          children: [
            Icon(Icons.dashboard, color: Colors.black),
            SizedBox(width: 6),
            Text(
              "Flutter Admin App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFFCFCFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Text(
                      "Add new item",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: Row(
                      children: [
                        Text("Users data"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 660,
                    width: 500,
                    color: Color(0xFFFCFCFC),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText("Title"),
                          customFormField(TextInputType.text, _titleController,
                              context, "Title", (val) {}),
                          CustomText("Description"),
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
                          CustomText("Type"),
                          customFormField(
                            TextInputType.text,
                            _typeController,
                            context,
                            "Type",
                            (val) {},
                            readOnly: true,
                          ),
                          CustomText("Thumbnail url"),
                          customFormField(TextInputType.text, _imgController,
                              context, "thumbnail url", (val) {}),
                          CustomText("Video source link"),
                          customFormField(
                              TextInputType.text,
                              _thumbnailController,
                              context,
                              "Video source link",
                              (val) {}),
                          CustomText("Category"),
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
                              ElevatedButton(
                                onPressed: () {
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
                                },
                                child: Text("Submit"),
                              ),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
