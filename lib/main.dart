// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/gallery_view.dart';
import 'views/image_detail_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Image Gallery',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GalleryView()),
        GetPage(
          name: '/image_detail',
          page: () => ImageDetailView(),
        ),
      ],
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
