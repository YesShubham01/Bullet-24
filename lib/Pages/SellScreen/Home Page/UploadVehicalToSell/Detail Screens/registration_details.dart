import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:provider/provider.dart';

class RegistrationDetails extends StatefulWidget {
  const RegistrationDetails({Key? key}) : super(key: key);

  @override
  State<RegistrationDetails> createState() => _RegistrationDetailsState();
}

class _RegistrationDetailsState extends State<RegistrationDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QueryPageProvider>().setAllowNext(false);
    context.read<QueryPageProvider>().checkRcPageDetailIfEntered();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vehicle Registration Details",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          RegistrationForm(),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text =
        context.read<QueryPageProvider>().myVehical!.meterReading.toString();
  }

  @override
  Widget build(BuildContext context) {
    context.read<QueryPageProvider>().checkRcPageDetailIfEntered();

    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Registration Certificate (RC)",
            hintText: "Enter RC number",
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          keyboardType: TextInputType.number,
          controller: _controller,
          onChanged: (value) {
            int? reading = int.tryParse(value);
            if (reading != null) {
              context.read<QueryPageProvider>().setRcNumber(reading);
              context.read<QueryPageProvider>().checkMeterPageDetailIfEntered();
            }
          },
        ),
        const SizedBox(height: 16.0),
        context.watch<QueryPageProvider>().isRcImageUploaded()
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
                  UploadImage.showImageSourceDialog(context, "RC");
                },
                child: Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      "Tap to upload RC Photo",
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
