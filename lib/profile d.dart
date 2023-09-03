import 'package:fitebase_machinetest/machine_test/models/profile_models.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({
    super.key,
    required this.profileModel,
  });
  final ProfileModel profileModel;
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 80,
                backgroundImage: widget.profileModel.image.isEmpty ||
                        widget.profileModel.image == 'NA'
                    ? const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeeUl9IZDN97pBQNgeunx6dD1df-4g7vkPFw&usqp=CAU')
                    : NetworkImage(widget.profileModel.image)),
            Text(
              'Product name: ${widget.profileModel.name},',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Product  price:${widget.profileModel.price},',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Product description:${widget.profileModel.description},',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
