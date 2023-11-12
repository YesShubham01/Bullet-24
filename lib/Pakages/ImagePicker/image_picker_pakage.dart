import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UploadImage {
  static Future<void> pickImage(bool isCamera) async {
    XFile? pickedFile;
    if (isCamera) {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      print("Image path: ${pickedFile.path}");
    } else {
      print("No image selected");
    }
  }

  static void showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Image Source",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text("Choose the source for your image"),
          actions: [
            Center(
              child: Wrap(
                spacing: 20.0,
                runSpacing: 10.0,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        UploadImage.pickImage(true);
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text("Camera"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        UploadImage.pickImage(false);
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("Gallery"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
