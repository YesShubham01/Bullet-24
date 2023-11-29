import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:provider/provider.dart';

import 'upload_vehical_images.dart';

class TankPhoto extends StatefulWidget {
  const TankPhoto({Key? key}) : super(key: key);

  @override
  State<TankPhoto> createState() => _TankPhotoState();
}

class _TankPhotoState extends State<TankPhoto> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QueryPageProvider>().setAllowNext(false);
  }

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
        context.watch<QueryPageProvider>().isTankImageUploaded()
            ? Container(
                height: 100,
                color: Colors.green[100],
                child: const Center(
                  child: Text(
                    "Uploaded Successfully",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              )
            : const ImageUploadSection(label: "Tank"),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
