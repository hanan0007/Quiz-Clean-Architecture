import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppImgesController extends GetxController {
  // A list of URLs to preload and cache
  final BuildContext context;
  AppImgesController(this.context);
  final List<String> _imageUrls = [
    'https://images.pexels.com/photos/2886268/pexels-photo-2886268.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2834917/pexels-photo-2834917.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/6424589/pexels-photo-6424589.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2360424/pexels-photo-2360424.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://w0.peakpx.com/wallpaper/635/405/HD-wallpaper-tariq-collection-blub-fantastic-landscape-nature-premium-science-technology-tree-world.jpg'
    // Add more URLs as needed
  ];
  // A map to store the cached images
  // A list to store the cached images
  final List<Image> _cachedImages = [];

  imageProviderService(BuildContext context) {
    _preloadImages(context);
  }

  // Preload and cache the images
  void _preloadImages(BuildContext context) {
    for (var url in _imageUrls) {
      final image = Image.network(
        url,
        fit: BoxFit.fill,
      );
      _cachedImages.add(image);
      precacheImage(image.image, context);
    }
  }

  // Get an image by index
  Image getImageByIndex(int index) {
    if (index >= 0 && index < _cachedImages.length) {
      return _cachedImages[index];
    } else {
      throw IndexError(index, _cachedImages);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageProviderService(context);
  }
}
