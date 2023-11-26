import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  static Future<void> saveUserDataToFirestore(String name, String number,
      String email, String rollno, String branch, String graduationyear) async {
    try {
      // Get the current authenticated user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create a map with the user data
        Map<String, dynamic> userData = {
          'name': name,
          'phone': number,
          'email': email.toLowerCase(),
          'rollNo': rollno,
          'branch': branch.toLowerCase(),
          'graduationYear': graduationyear,
        };

        // Get a reference to the Firestore database
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Set the user data in Firestore under the user's UID
        await firestore.collection('Users').doc(user.uid).set(userData);

        print('User data stored in Firestore for UID: ${user.uid}');
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

  static Future<UserDetail> getUserDataFromFirestore() async {
    try {
      // Get the current authenticated user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Get a reference to the Firestore database
        FirebaseFirestore firestore = FirebaseFirestore.instance;

        // Get the document snapshot for the user's UID
        DocumentSnapshot documentSnapshot =
            await firestore.collection('Users').doc(user.uid).get();

        // Check if the document exists
        if (documentSnapshot.exists) {
          // Return the data as a UserDetail object
          return UserDetail(
            name: documentSnapshot['name'] ?? "",
            number: documentSnapshot['phone'] ?? "",
            email: documentSnapshot['email'] ?? "",
            rollno: documentSnapshot['rollNo'] ?? "",
            branch: documentSnapshot['branch'] ?? "",
            graduationyear: documentSnapshot['graduationYear'] ?? "",
          );
        } else {
          print('Document does not exist for UID: ${user.uid}');
          return UserDetail();
        }
      } else {
        print('User not authenticated');
        return UserDetail();
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return UserDetail();
    }
  }

  static Future<PostDetails> getMananAuditionDetails() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('Events')
          .doc('Manan Audition')
          .get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        return PostDetails(
          title: data['description'] ?? '',
          link: data['link'] ?? '',
          date: data['date'] ?? '',
        );
      } else {
        // Document doesn't exist
        return PostDetails();
      }
    } catch (e) {
      print('Error retrieving Manan Audition details: $e');
      return PostDetails();
    }
  }
}
