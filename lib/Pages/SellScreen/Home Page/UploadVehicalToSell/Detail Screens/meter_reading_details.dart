import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:provider/provider.dart';

class MeterReadingPhotos extends StatefulWidget {
  const MeterReadingPhotos({Key? key}) : super(key: key);

  @override
  State<MeterReadingPhotos> createState() => _MeterReadingPhotosState();
}

class _MeterReadingPhotosState extends State<MeterReadingPhotos> {
  final _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QueryPageProvider>().setAllowNext(false);
    context.read<QueryPageProvider>().checkMeterPageDetailIfEntered();

    _controller.text =
        context.read<QueryPageProvider>().myVehical!.meterReading.toString();
  }

  @override
  Widget build(BuildContext context) {
    context.read<QueryPageProvider>().checkMeterPageDetailIfEntered();

    return Column(
      children: [
        _buildMeterReadingSection(),
        const SizedBox(height: 16.0), // Add spacing between sections
        _buildMeterPhotoSection(context),
      ],
    );
  }

  Widget _buildMeterReadingSection() {
    context.read<QueryPageProvider>().checkMeterPageDetailIfEntered();

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
          controller: _controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Meter reading is required";
            }
            // You can add additional validation logic here if needed
            return null;
          },
          onChanged: (value) {
            int? reading = int.tryParse(value);
            if (reading != null) {
              context.read<QueryPageProvider>().setMeterReading(reading);
              context.read<QueryPageProvider>().checkMeterPageDetailIfEntered();
            }
          },
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildMeterPhotoSection(BuildContext context) {
    return context.watch<QueryPageProvider>().isMeterImageUploaded()
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
        : InkWell(
            onTap: () {
              UploadImage.showImageSourceDialog(context, "Meter");
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
