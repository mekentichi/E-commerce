import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/home_controller.dart';
import '../../core/static/color.dart';
import '../../linkapi/linkapi.dart';
import '../../model/categories_model.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoriesModel(
                i: index,
                categoriesModel: CategoriesModelStatic.fromJson(
                    controller.categories[index]));
          }),
    );
  }
}

class CategoriesModel extends GetView<HomePageControllerImp> {
  final CategoriesModelStatic categoriesModel;
  final int i;

  const CategoriesModel(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:AppColor.secondycolor,
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "${LinkApi.imagescategories}/${categoriesModel.categoriesImage}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
