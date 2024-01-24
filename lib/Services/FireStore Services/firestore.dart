import 'dart:async';
import 'package:bullet24/Objects/user_detail.dart';
import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Services/FireAuth%20Service/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  static Future<List<VehicalDetail>> fetchVehicalsByModel(
      BulletModel model) async {
    try {
      // Get a reference to the Firestore database
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get all documents from the "Active Vehicals" collection
      QuerySnapshot querySnapshot =
          await firestore.collection('Active Vehicals').get();

      // Process the documents in the snapshot
      List<VehicalDetail> filteredVehicals = querySnapshot.docs
          .map((DocumentSnapshot document) {
            Map<String, dynamic>? data =
                document.data() as Map<String, dynamic>?;

            if (data != null) {
              // Check if the model in the document matches the provided model parameter
              if (BulletModel.values[data['model'] ?? 0] == model) {
                return VehicalDetail(
                  ownerName: data['ownerName'] ?? "",
                  number: data['number'] ?? "",
                  company: Company.values[data['company'] ?? 0] ??
                      Company.royalEnfield,
                  model: BulletModel.values[data['model'] ?? 0] ??
                      BulletModel.bullet350,
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
                  vehicalId: document.id,
                );
              }
            } else {
              print('Data in Firestore document is null.');
            }
            // If the model doesn't match or data is null, return null
            return null;
          })
          .whereType<VehicalDetail>() // Filter out null values
          .toList();

      return filteredVehicals;
    } catch (e) {
      print('Error retrieving Vehical details: $e');
      return [VehicalDetail(ownerName: "error")];
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
              model: BulletModel.values[data['model'] ?? 0] ??
                  BulletModel.bullet350,
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
              vehicalId: document.id // i want document id here.
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
    String? userId = await getUserId();
    String documentId = await getDocumentIdForVehicalUpload(userId!, 0);
    try {
      await FirebaseFirestore.instance
          .collection('Active Vehicals')
          .doc(documentId)
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
      await addVehicleToUser(userId, documentId);
    } catch (e) {
      print('Error uploading Vehical details: $e');
      // Handle the error as needed
    }
  }

  static Future<String> getDocumentIdForVehicalUpload(
      String documentId, int index) async {
    index++;
    bool doExist = await checkDocumentExists(documentId);
    if (doExist) {
      documentId = "${documentId}_$index";
      return getDocumentIdForVehicalUpload(documentId, index);
    } else {
      return documentId;
    }
  }

  static Future<bool> checkDocumentExists(String documentId) async {
    try {
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("Active Vehicals")
          .doc(documentId)
          .get();

      return documentSnapshot.exists;
    } catch (e) {
      // Handle errors, e.g., network issues, etc.
      print('Error checking document existence: $e');
      return false;
    }
  }

  static Future<void> addVehicleToUser(String userId, String vehicle) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'vehicles': FieldValue.arrayUnion([vehicle]),
      });
    } catch (e) {
      print('Error adding vehicle to user: $e');
      // Handle the error as needed
    }
  }

  static Future<List<String>> fetchNotifications(BuildContext context) async {
    UserDetail user = context.read<MyProvider>().userDetail;

    try {
      // Reference to the "Users" collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      // Document reference under the provided UID
      DocumentReference userDocument = usersCollection.doc(user.uid);

      // Get the user document snapshot
      DocumentSnapshot userSnapshot = await userDocument.get();

      // Check if the user document exists
      if (userSnapshot.exists) {
        // Get the data from the user document
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        // Check if the "notification" field exists in the user data
        if (userData.containsKey('notification')) {
          // Return the notification array
          return List.from(userData['notification']);
        } else {
          // Return an empty list if the "notification" field doesn't exist
          return [];
        }
      } else {
        // Return an empty list if the user document doesn't exist
        return [];
      }
    } catch (e) {
      // Handle any errors that occurred during the process
      print('Error fetching notifications: $e');
      return [];
    }
  }

  static Future<void> checkUserDocument(BuildContext context) async {
    UserDetail user = context.read<MyProvider>().userDetail;

    if (await doesUserExist(user.uid ?? "null")) {
      // User document exists, nothing to do
    } else {
      await addUserDocument(user);
    }
  }

  static Future<bool> doesUserExist(String uid) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocument = usersCollection.doc(uid);

      DocumentSnapshot userSnapshot = await userDocument.get();

      return userSnapshot.exists;
    } catch (e) {
      print('Error checking if user exists: $e');
      return false;
    }
  }

  static Future<void> addUserDocument(UserDetail user) async {
    if (!Authenticate.isLoggedIn()) {
      print("User not logged in");
      // Consider redirecting the user to the login screen or handling the situation.
      return;
    }

    String uid = user.uid ?? "Null";
    String name = user.name ?? "Null";
    String phoneNumber = user.phone ?? "Null";
    List<dynamic> notifications = user.notification ?? [];

    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      DocumentReference userDocument = usersCollection.doc(uid);

      bool userExists = (await userDocument.get()).exists;

      if (!userExists) {
        await userDocument.set({
          'notification': notifications,
          'name': name,
          'phoneNumber': phoneNumber,
        });
        print('User document added successfully!');
      } else {
        print('User document already exists!');
      }
    } catch (e) {
      print('Error adding user document: $e');
    }
  }

  static Future<String> checkAndUpdateBid(
      String vehicleId, String amount) async {
    try {
      // Reference to the "Active Vehicles" collection
      CollectionReference vehiclesCollection =
          FirebaseFirestore.instance.collection('Active Vehicals');

      // Document reference using the provided vehicle ID
      DocumentReference vehicleDocument = vehiclesCollection.doc(vehicleId);

      DocumentSnapshot vehicleSnapshot = await vehicleDocument.get();

      if (vehicleSnapshot.exists) {
        // Explicitly cast data to Map<String, dynamic>
        Map<String, dynamic>? vehicleData =
            vehicleSnapshot.data() as Map<String, dynamic>?;

        // Check if the 'bid' field exists in the vehicle data
        if (vehicleData?.containsKey('bid') == false) {
          // 'bid' field does not exist, create it with a value of null
          await vehicleDocument.update({'bid': amount});
          print('Bid field created with a value of null.');
          return amount;
        } else {
          // 'bid' field exists, fetch its value
          String bidValue = vehicleData?['bid'];
          print('Bid value: $bidValue');

          return bidValue;
        }
      } else {
        print('Vehicle document does not exist for ID: $vehicleId');
        return "null";
      }
    } catch (e) {
      print('Error checking/updating bid: $e');
      // Handle the error as needed
      return "null";
    }
  }

  static Future<String> updateBid(
      String vehicleId, String newBid, String username) async {
    try {
      // Reference to the "Active Vehicals" collection
      CollectionReference vehiclesCollection =
          FirebaseFirestore.instance.collection('Active Vehicals');

      // Document reference using the provided vehicle ID
      DocumentReference vehicleDocument = vehiclesCollection.doc(vehicleId);

      DocumentSnapshot vehicleSnapshot = await vehicleDocument.get();

      if (vehicleSnapshot.exists) {
        // Update the 'bid' field with the new bid value
        // and add a bidder key with the bidderName
        await vehicleDocument.update({
          'bid': newBid,
          'bidder': username,
        });
        print('Bid updated successfully.');
        return newBid;
      } else {
        print('Vehicle document does not exist for ID: $vehicleId');
        return "null";
      }
    } catch (e) {
      print('Error updating bid: $e');
      // Handle the error as needed
      return "null";
    }
  }

  static Future<List<VehicalDetail>> searchVehiclesWithBid() async {
    try {
      // Reference to the "Active Vehicals" collection
      CollectionReference vehiclesCollection =
          FirebaseFirestore.instance.collection('Active Vehicals');

      // Query vehicles where 'bid' attribute exists
      QuerySnapshot querySnapshot =
          await vehiclesCollection.where('bid', isNotEqualTo: null).get();

      // Process the documents in the snapshot
      List<VehicalDetail> vehiclesWithBid = querySnapshot.docs
          .map((DocumentSnapshot document) {
            Map<String, dynamic>? data =
                document.data() as Map<String, dynamic>?;

            if (data != null && data.containsKey('bid')) {
              // Convert 'bid' to int?
              int? bid = data['bid'] != null ? int.tryParse(data['bid']) : null;

              return VehicalDetail(
                ownerName: data['ownerName'] ?? "",
                number: data['number'] ?? "",
                company: Company.values[data['company'] ?? 0],
                model: BulletModel.values[data['model'] ?? 0],
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
                bid: bid,
                vehicalId: document.id,
              );
            } else {
              print(
                  'Data in Firestore document is null or does not contain "bid".');
              return null;
            }
          })
          .whereType<VehicalDetail>() // Filter out null values
          .toList();

      return vehiclesWithBid;
    } catch (e) {
      print(e);
      throw Exception('Error searching vehicles with bid: $e');
    }
  }
}
