import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitebase_machinetest/machine_test/models/profile_models.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<List<ProfileModel>> profileList = Rx<List<ProfileModel>>([]);
  List<ProfileModel> get profiles => profileList.value;
  
  @override
  void onReady() {
    profileList.bindStream(profileStream());
  }
  Stream<List<ProfileModel>> profileStream() {
    return FirebaseFirestore.instance
        .collection('Profile')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProfileModel> profiles = [];
      for (var profile in query.docs) {
        final nawProfileModel =
        ProfileModel.fromDocumentSnapshot(documentSnapshot: profile);
        profiles.add(nawProfileModel);
      }
      return profiles;
    });
  }
  addProfile(
      String name,
      String price,
      String description,
      String image,
      ) {
    var addProfileData = Map<String, dynamic>();

    addProfileData['name'] = name;
    addProfileData['price'] = price;
    addProfileData['description'] = description;
    addProfileData['image'] = image;


    FirebaseFirestore.instance
        .collection('Profile')
        .add(addProfileData)
        .then((DocumentReference documentReference) {
      print('----------------------------------------');

      print('Profile ID: ${documentReference.id}');
      print('----------------------------------------');
    }).catchError((error) {
      print('----------------------------------------');
      print('Error adding profile: $error');
      print('----------------------------------------');
    });
  }
}
