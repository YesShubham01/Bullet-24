import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';

class InsuranceDetails extends StatelessWidget {
  const InsuranceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Insurance Details",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          InsuranceForm(),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class InsuranceForm extends StatelessWidget {
  const InsuranceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Insurance Policy Number",
            hintText: "Enter policy number",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            UploadImage.showImageSourceDialog(context, "Insurance");
          },
          child: Container(
            height: 100,
            color: Colors.grey[300],
            child: const Center(
              child: Text(
                "Tap to upload Insurance Document",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
