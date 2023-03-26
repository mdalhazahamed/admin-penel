import 'package:fitness_admin_project/ui/views/deshbord_1.dart';
import 'package:flutter/material.dart';

import '../widgets/customeButton.dart';
import '../widgets/custome_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String uid = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customFormField(TextInputType.emailAddress, _emailController,
                  context, "Email", (val) {
                if (val!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(val)) {
                  return ("Please Enter a valid email");
                }
                return null;
              }),
              customFormField(
                  TextInputType.text, _passwordController, context, "Password",
                  (val) {
                if (val!.isEmpty) {
                  return ("Password is required for login");
                }
              }),
              SizedBox(
                height: 50,
              ),
              customeButton("Login", () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Dashboard1()));
                // }
              }),
            ],
          ),
        ),
      )),
    );
  }
}
