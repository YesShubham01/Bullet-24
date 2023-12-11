import 'package:bullet24/Res/Theme/theme.dart';
import 'package:flutter/material.dart';

class HotDealSectionCard extends StatelessWidget {
  final String model;
  HotDealSectionCard({super.key, required this.model});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 130,
          width: 230,
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
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              _getFromVehicalModel(model),
              fit: BoxFit.cover, // Set BoxFit property
            ),
          ),
        ),
      ),
    );
  }

  String _getFromVehicalModel(String modelIndex) {
    // Check if it is a valid model name
    if (modelImageMap.containsKey(modelIndex)) {
      return modelImageMap[modelIndex]!;
    } else {
      // If the model name is not found, return a default image link
      return "images/Model Images/continental-gt-650-thumbnail.jpg";
    }
  }
}
