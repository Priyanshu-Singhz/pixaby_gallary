// gallery_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';

class GalleryView extends StatelessWidget {
  final GalleryController controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Obx(() => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Maximum width of each item
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: controller.images.length,
        itemBuilder: (context, index) {
          final image = controller.images[index];
          return GestureDetector(
            onTap: () => Get.toNamed('/image_detail', arguments: image.imageUrl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: image.imageUrl, // Unique hero tag for each image
                    child: Image.network(image.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 4),
                Text('Likes: ${image.likes}'),
                Text('Views: ${image.views}'),
              ],
            ),
          );
        },
      )),
    );
  }
}
