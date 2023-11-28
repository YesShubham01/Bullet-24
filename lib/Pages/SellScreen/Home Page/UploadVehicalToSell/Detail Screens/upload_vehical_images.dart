import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:flutter/material.dart';

class FrontSideRearPhotos extends StatelessWidget {
  const FrontSideRearPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildImageUploadSection("Front"),
        _buildImageUploadSection("Side"),
        _buildImageUploadSection("Rear"),
      ],
    );
  }

  Widget _buildImageUploadSection(String label) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ImageUploadSection(label: label),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class ImageUploadSection extends StatelessWidget {
  final String label;

  const ImageUploadSection({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UploadImage.showImageSourceDialog(context, label);
      },
      child: Container(
        height: 100,
        color: Colors.grey[300],
        child: Center(
          child: Text(
            "Tap to upload $label image",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
