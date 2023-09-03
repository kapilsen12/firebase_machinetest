
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitebase_machinetest/machine_test/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class formpage extends StatefulWidget {
  const formpage({super.key});

  @override
  State<formpage> createState() => _formpageState();
}

class _formpageState extends State<formpage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final TextEditingController imageCont = TextEditingController();

  final ProfileController profileCont = Get.put(ProfileController());

  final TextEditingController nameCont = TextEditingController();
  final TextEditingController priceCont = TextEditingController();
  final TextEditingController descriptionCont = TextEditingController();


  Future uplodeImageToFirebase(BuildContext context) async {
    String fileName = basename(image!.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image/$fileName");
    UploadTask uploadTask = ref.putFile(File(image!.path));
    uploadTask.then((res) async {
      String imageUrl = await (await uploadTask).ref.getDownloadURL();
      print(imageUrl);
      imageCont.text = imageUrl;
      submitForm();
    });
  }

  void submitForm() {
    profileCont.addProfile(
      nameCont.text,
      priceCont.text,
      descriptionCont.text,
      imageCont.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form-page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.grey),
                    ),
                    child: Center(
                        child: image == null
                            ? const Icon(
                                Icons.add_circle,
                                size: 80,
                                color: Colors.grey,
                              )
                            : Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: nameCont,
                  decoration: InputDecoration(
                    labelText: 'Enter your item name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: priceCont,
                  decoration: InputDecoration(
                    labelText: 'Enter your price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: descriptionCont,
                  decoration: InputDecoration(
                    labelText: 'Enter your description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    uplodeImageToFirebase(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
