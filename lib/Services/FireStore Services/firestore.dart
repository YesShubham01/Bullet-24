import 'dart:async';
import 'package:bullet24/Objects/user_detail.dart';
import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  Future<UserDetail> getUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch additional user details from Firebase Authentication
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        return UserDetail(
            name: user!.displayName,
            phone: user.phoneNumber,
            profileImage: user.photoURL);
      } else {
        // No user is signed in
        return UserDetail(name: null, phone: null);
      }
    } catch (e) {
      print('Error fetching user details: $e');
      // Handle the error as needed
      return UserDetail(name: null, phone: null);
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
            phone: documentSnapshot['phone'] ?? "",
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

  static Future<List<VehicalDetail>> fetchAllVehicalDetails() async {
    try {
      // Get a reference to the Firestore database
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get all documents from the "Active Vehicals" collection
      QuerySnapshot querySnapshot =
          await firestore.collection('Active Vehicals').get();

      // Process the documents in the snapshot
      List<VehicalDetail> vehicalDetailsList =
          querySnapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        if (data != null) {
          return VehicalDetail(
            ownerName:
                data['ownerName'] ?? "", // Replace with actual field name
            number: data['number'] ?? "",
            company:
                Company.values[data['company'] ?? 0] ?? Company.royalEnfield,
            model:
                BulletModel.values[data['model'] ?? 0] ?? BulletModel.bullet350,
            estPrice: data['estPrice'] ?? "",
            yearOfRelese: data['yearOfRelese'] ?? 0,
            yearOfPurchase: data['yearOfPurchase'] ?? 0,
            meterReading: data['meterReading'] ?? 0,
            frontPhoto: data['frontPhoto'] ?? "",
            sidePhoto: data['sidePhoto'] ?? "",
            rearPhoto: data['rearPhoto'] ?? "",
            tankPhoto: data['tankPhoto'] ?? "",
            rcNumber: data['rcNumber'] ?? "",
            insuranceNumber: data['insuranceNumber'] ?? "",
          );
        } else {
          print('Data in Firestore document is null.');
          return VehicalDetail(ownerName: "error");
        }
      }).toList();

      return vehicalDetailsList;
    } catch (e) {
      print('Error retrieving Vehical details: $e');
      return [VehicalDetail(ownerName: "error")];
    }
  }

  static Future<String?> getUserId() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // The user is signed in
        return user.uid;
      } else {
        // No user is signed in
        return null;
      }
    } catch (e) {
      print('Error getting user ID: $e');
      return null;
    }
  }

// function to upload Vehical Details.
  static Future<void> uploadVehicalDetail(VehicalDetail vehicalDetail) async {
    try {
      String? userId = await getUserId();
      await FirebaseFirestore.instance
          .collection('Active Vehicals')
          .doc("$userId")
          .set({
        'ownerName': vehicalDetail.ownerName,
        'number': vehicalDetail.number,
        'company': vehicalDetail.company?.index ?? 0,
        'model': vehicalDetail.model?.index ?? 0,
        'estPrice': vehicalDetail.estPrice,
        'yearOfRelese': vehicalDetail.yearOfRelese,
        'yearOfPurchase': vehicalDetail.yearOfPurchase,
        'meterReading': vehicalDetail.meterReading,
        'frontPhoto': vehicalDetail.frontPhoto,
        'sidePhoto': vehicalDetail.sidePhoto,
        'rearPhoto': vehicalDetail.rearPhoto,
        'tankPhoto': vehicalDetail.tankPhoto,
        'rcNumber': vehicalDetail.rcNumber,
        'insuranceNumber': vehicalDetail.insuranceNumber,
      });
    } catch (e) {
      print('Error uploading Vehical details: $e');
      // Handle the error as needed
    }
  }
}
