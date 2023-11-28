import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';

import 'upload_vehical_images.dart';

class TankPhoto extends StatelessWidget {
  const TankPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildImageUploadSection("Tank Photo", context),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(String label, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InkWell(
            onTap: () {
              UploadImage.showImageSourceDialog(context, "Tank");
            },
            child: ImageUploadSection(label: label)),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
