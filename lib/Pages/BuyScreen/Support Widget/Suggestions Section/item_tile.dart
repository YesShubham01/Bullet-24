import 'package:bullet24/Objects/vehical_detail.dart';
import 'package:bullet24/Pages/BuyScreen/Item%20Page/item_page.dart';
import 'package:flutter/material.dart';
import 'package:bullet24/Res/Theme/theme.dart';

class VehicalItemTile extends StatelessWidget {
  final VehicalDetail vehicalDetail;

  VehicalItemTile({Key? key, required this.vehicalDetail}) : super(key: key);

  final Map<String, String> modelMap = {
    'BulletModel.bullet350': 'Bullet 350',
    'BulletModel.classic350': 'Classic 350',
    'BulletModel.hunter350': 'Hunter 350',
    'BulletModel.scram411': 'Scram 411',
    'BulletModel.meteor350': 'Meteor 350',
    'BulletModel.superMeteor650': 'Super Meteor 650',
    'BulletModel.himalayan': 'Himalayan',
    'BulletModel.newHimalayan': 'New Himalayan',
    'BulletModel.interceptor': 'Interceptor',
    'BulletModel.continentalGT': 'Continental GT',
  };

  String modelToName(String model) {
    return modelMap[model] ?? "Error";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // You may want to navigate to a detailed page with vehicalDetail
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ItemPage(vehicalDetail: vehicalDetail)));
            },
            child: Container(
              height: 140,
              width: 140,
              decoration: ShapeDecoration(
                color: BS_FSG_button_false_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: shadow_false,
                    blurRadius: 4,
                    offset: const Offset(-2, 6),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _getFromVehicalModel(vehicalDetail),
                  fit: BoxFit.cover, // Set BoxFit property
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Text(
              modelToName(
                vehicalDetail.model.toString(),
              ), // Use actual property from VehicalDetail
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "\$${vehicalDetail.estPrice}", // Use actual property from VehicalDetail
              style: TextStyle(
                fontSize: 14,
                color: B_TNAV_COLOR,
              ),
            ),
          )
        ],
      ),
    );
  }

  final Map<String, String> modelImageMap = {
    'bullet350': "images/Model Images/bullet-350-motorcycle-listing.jpg",
    'classic350': "images/Model Images/classic-350-motorcycle.jpg",
    'hunter350': "images/Model Images/hunter-350-motorcycle-landing.jpg",
    'scram411': "images/Model Images/scram-411-listing.jpg",
    'meteor350': "images/Model Images/meteor-350-hero-color.png.jpeg",
    'superMeteor650': "images/Model Images/motorcycle_landing.png.jpeg",
    'himalayan': "images/Model Images/royal-enfield-himalayan-motorcycles.jpg",
    'newHimalayan': "images/Model Images/new-himalayan-motorcycle-listing.jpg",
    'interceptor': "images/Model Images/interceptor-650-thumbnail.jpg",
    'continentalGT': "images/Model Images/continental-gt-650-thumbnail.jpg",
  };

  String _getFromVehicalModel(VehicalDetail vehicalDetail) {
    //check if it is a bullet.

    // Convert the BulletModel to a string
    String modelName = vehicalDetail.model?.toString().split('.').last ?? '';
    print(modelName);

    // Check if it is a valid model name
    if (modelImageMap.containsKey(modelName)) {
      return modelImageMap[modelName]!;
    } else {
      // If the model name is not found, return a default image link
      return "images/Model Images/continental-gt-650-thumbnail.jpg";
    }
  }
}
