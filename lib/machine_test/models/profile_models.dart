import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  ProfileModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  String? documentId;
  late String name;
  late String price;
  late String description;
  late String image;

  ProfileModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    name = documentSnapshot['name'];
    price = documentSnapshot['price'];
    image = documentSnapshot['image'];
    description = documentSnapshot['description'];
  }
}
