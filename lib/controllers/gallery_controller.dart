// gallery_controller.dart

import 'package:get/get.dart';
import '../services/image_service.dart';
import '../models/image_model.dart';

class GalleryController extends GetxController {
  final ImageService _imageService = ImageService();
  final images = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      final List<ImageModel> fetchedImages = await _imageService.fetchImages();
      images.assignAll(fetchedImages);
    } catch (e) {
      print('Error fetching images: $e');
    }
  }
}
