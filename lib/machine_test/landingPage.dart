import 'package:fitebase_machinetest/form%20page.dart';
import 'package:fitebase_machinetest/machine_test/controller/profile_controller.dart';
import 'package:fitebase_machinetest/profile%20d.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class itemlist extends StatefulWidget {
  const itemlist({super.key});

  @override
  State<itemlist> createState() => _itemlistState();
}

class _itemlistState extends State<itemlist> {
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Item list'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(formpage());
              },
              icon: Icon(Icons.add_circle_outline_rounded))
        ],
      ),
      body: StreamBuilder(
          stream: _profileController.profileStream(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return !(snapshot.hasData)
                ? const Center(child: CircularProgressIndicator())
                : _profileController.profiles.isEmpty
                    ? const Center(child: Text('No data'))
                    : ListView.builder(
                        itemCount: _profileController.profiles.length,
                        itemBuilder: (context, index) {
                          print(_profileController.profiles[index].name);
                          final profileModel =
                              _profileController.profiles[index];

                          return SingleChildScrollView(
                            child: Card(
                              margin: const EdgeInsets.all(16.0),
                              child: ListTile(
                                onTap: () {
                                  Get.to(profile(
                                    profileModel: profileModel,
                                  ));
                                },
                                leading:  CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: NetworkImage(profileModel.image),
                                ),
                                title: Text(profileModel.name),
                                subtitle: Text(profileModel.price),
                              ),
                            ),
                          );
                        });
          }),
    );
  }
}
