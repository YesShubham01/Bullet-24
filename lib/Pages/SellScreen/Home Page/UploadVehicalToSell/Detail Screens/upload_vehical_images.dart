import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrontSideRearPhotos extends StatefulWidget {
  const FrontSideRearPhotos({Key? key}) : super(key: key);

  @override
  State<FrontSideRearPhotos> createState() => _FrontSideRearPhotosState();
}

class _FrontSideRearPhotosState extends State<FrontSideRearPhotos> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QueryPageProvider>().setAllowNext(false);
    context.read<QueryPageProvider>().checkAllVehicalImageUploaded();
  }

  @override
  Widget build(BuildContext context) {
    context.read<QueryPageProvider>().checkAllVehicalImageUploaded();

    return ListView(
      children: [
        context.watch<QueryPageProvider>().isFrontImageUploaded()
            ? Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Front",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
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
                  ),
                ],
              )
            : _buildImageUploadSection("Front"),
        context.watch<QueryPageProvider>().isSideImageUploaded()
            ? Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Side",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
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
                  ),
                ],
              )
            : _buildImageUploadSection("Side"),
        context.watch<QueryPageProvider>().isRearImageUploaded()
            ? Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Rear",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
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
                  ),
                ],
              )
            : _buildImageUploadSection("Rear"),
      ],
    );
  }

  Widget _buildImageUploadSection(String label) {
    context.read<QueryPageProvider>().checkAllVehicalImageUploaded();
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
