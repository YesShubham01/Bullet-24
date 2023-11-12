import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';

class MeterReadingPhotos extends StatelessWidget {
  const MeterReadingPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMeterReadingSection(),
        const SizedBox(height: 16.0), // Add spacing between sections
        _buildMeterPhotoSection(context),
      ],
    );
  }

  Widget _buildMeterReadingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0, top: 30),
          child: Text(
            "Meter Reading",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Enter meter reading",
            labelText: "Meter Reading",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Meter reading is required";
            }
            // You can add additional validation logic here if needed
            return null;
          },
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildMeterPhotoSection(BuildContext context) {
    return InkWell(
      onTap: () {
        UploadImage.showImageSourceDialog(context);
      },
      child: Container(
        height: 100,
        color: Colors.grey[300],
        child: const Center(
          child: Text(
            "Tap to upload Meter Photo",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
