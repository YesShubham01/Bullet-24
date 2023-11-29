import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Pakages/ImagePicker/image_picker_pakage.dart';
import 'package:provider/provider.dart';

class InsuranceDetails extends StatefulWidget {
  const InsuranceDetails({Key? key}) : super(key: key);

  @override
  State<InsuranceDetails> createState() => _InsuranceDetailsState();
}

class _InsuranceDetailsState extends State<InsuranceDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QueryPageProvider>().setAllowNext(false);
    context.read<QueryPageProvider>().checkInsurancePageDetailIfEntered();
  }

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

class InsuranceForm extends StatefulWidget {
  const InsuranceForm({Key? key}) : super(key: key);

  @override
  State<InsuranceForm> createState() => _InsuranceFormState();
}

class _InsuranceFormState extends State<InsuranceForm> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text =
        (context.read<QueryPageProvider>().myVehical!.insuranceNumber ?? '')
            .toString();
  }

  @override
  Widget build(BuildContext context) {
    context.read<QueryPageProvider>().checkInsurancePageDetailIfEntered();

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
          controller: _controller,
          onChanged: (value) {
            int? reading = int.tryParse(value);
            if (reading != null) {
              context.read<QueryPageProvider>().setInsuranceNumber(reading);
              context
                  .read<QueryPageProvider>()
                  .checkInsurancePageDetailIfEntered();
            }
          },
        ),
        const SizedBox(height: 16.0),
        context.watch<QueryPageProvider>().isInsuranceImageUploaded()
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
