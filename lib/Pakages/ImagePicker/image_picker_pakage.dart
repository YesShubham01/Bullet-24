import 'dart:io';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadImage {
  static Future<void> pickImage(
      bool isCamera, String photoOf, BuildContext context) async {
    XFile? pickedFile;
    if (isCamera) {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      await _uploadImageToFirebaseStorage(pickedFile.path, photoOf, context);
      print("Image path: ${pickedFile.path}");
    } else {
      print("No image selected");
    }
  }

  static Future<void> _uploadImageToFirebaseStorage(
      String filePath, String photoOf, BuildContext context) async {
    try {
      File file = File(filePath);
      Reference storageReference =
          FirebaseStorage.instance.ref().child("images/${DateTime.now()}.png");

      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() => null);
      String downloadURL = await storageReference.getDownloadURL();
      print("~~~~ Here is download Link Shubham --> $downloadURL ~~~~~");
      _setLinkInVehicalDetails(downloadURL, photoOf, context);
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  static Future<void> _setLinkInVehicalDetails(
      String downloadURL, String photoOf, BuildContext context) async {
    // Accessing the VehicalDetails instance from your provider
    QueryPageProvider provider = context.read<QueryPageProvider>();

    switch (photoOf) {
      case "Front":
        provider.setFrontImage(downloadURL);
        break;

      case "Rear":
        provider.setRearImage(downloadURL);
        break;

      case "Side":
        provider.setSideImage(downloadURL);
        break;

      case "Meter":
        provider.setMeterImage(downloadURL);
        break;

      case "Tank":
        provider.setTankImage(downloadURL);
        break;

      case "RC":
        provider.setRcImage(downloadURL);
        break;

      // Add more cases as needed
      case "Insurance":
        provider.setInsuranceImage(downloadURL);
        break;

      default:
        print("Unknown photo type: $photoOf");
    }
    print("Uploaded Successfully");
  }

  static void showImageSourceDialog(BuildContext context, String photoOf) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UploadImageDialog(photoOf: photoOf);
      },
    );
  }
}

class UploadImageDialog extends StatefulWidget {
  final String photoOf;

  const UploadImageDialog({Key? key, required this.photoOf}) : super(key: key);

  @override
  _UploadImageDialogState createState() => _UploadImageDialogState();
}

class _UploadImageDialogState extends State<UploadImageDialog> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Select Image Source",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: _isProcessing
          ? const Center(child: CircularProgressIndicator())
          : const Text("Choose the source for your image"),
      actions: [
        Center(
          child: Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            children: [
              ElevatedButton.icon(
                onPressed: () => _onTap(true),
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              ElevatedButton.icon(
                onPressed: () => _onTap(false),
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _onTap(bool isCamera) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      XFile? pickedFile;
      if (isCamera) {
        pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (pickedFile != null) {
        await UploadImage._uploadImageToFirebaseStorage(
            pickedFile.path, widget.photoOf, context);
        print("Image path: ${pickedFile.path}");
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error during image processing: $e");
    } finally {
      setState(() {
        _isProcessing = false;
      });

      Navigator.of(context).pop(); // Close the dialog after completion
    }
  }
}
