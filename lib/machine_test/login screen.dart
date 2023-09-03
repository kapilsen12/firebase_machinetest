import 'package:fitebase_machinetest/machine_test/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginS extends StatefulWidget {
  const loginS({super.key});

  @override
  State<loginS> createState() => _loginSState();
}

class _loginSState extends State<loginS> {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailCont,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passCont,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: (isChecked),
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      }),
                  Text('I have red agreement and i accepet it'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(itemlist());
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
