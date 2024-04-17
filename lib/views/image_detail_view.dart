// image_detail_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imageUrl = Get.arguments;
    
    return Scaffold(
      appBar: AppBar(title: Text('Image Detail')),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              imageUrl,
              // fit: BoxFit.cover, // Use BoxFit.cover to fill the container
            ),
          ),
        ),
      ),
    );
  }
}
