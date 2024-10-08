import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/home/controllers/favourite_controller.dart';
import 'package:e_tourism/app/modules/home/views/widgets/favourite_items.dart';

class FavouriteNavPage extends GetView<FavouriteController> {
  @override
  Widget build(BuildContext context) {
    return FavouriteItems(controller: controller);
  }
}
