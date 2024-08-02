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
    'https://w0.peakpx.com/wallpaper/635/405/HD-wallpaper-tariq-collection-blub-fantastic-landscape-nature-premium-science-technology-tree-world.jpg',
    'https://img.freepik.com/premium-vector/spotlights-with-stage-vector-light-effect_165143-1861.jpg?w=740'
  ];

  final List<Image> _cachedImages = [];

  imageProviderService(BuildContext context) {
    _preloadImages(context);
  }

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

  Image getImageByIndex(int index) {
    if (index >= 0 && index < _cachedImages.length) {
      return _cachedImages[index];
    } else {
      throw IndexError(index, _cachedImages);
    }
  }

  @override
  void onInit() {
    super.onInit();
    imageProviderService(context);
  }
}
