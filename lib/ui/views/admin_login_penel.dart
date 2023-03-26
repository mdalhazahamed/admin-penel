import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import '../widgets/custome_form_field.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDADADA),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: Color(0xFFFCFCFC),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://marketplace.canva.com/EAFKGoCYJVU/1/0/1600w/canva-modern-gym-and-fitness-center-logo-7jzwRhamivw.jpg"),
                  ),
                ),
                SizedBox(height: 10),
                CustomText("Email"),
                customFormField(TextInputType.text, _emailController, context,
                    "Email", (val) {}),
                CustomText("Password"),
                customFormField(TextInputType.text, _passwordController,
                    context, "Passowrd", (val) {}),

                TextButton(
                  onPressed: () {
                    //onSubmit();
                  },
                  child: Center(child: Text("Login")),
                ),
                // TextButton(
                //   onPressed: () {
                //     getData();
                //   },
                //   child: Text("Get Data"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
