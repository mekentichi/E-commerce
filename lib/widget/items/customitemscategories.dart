import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/items_controller.dart';
import '../../core/static/color.dart';
import '../../model/categories_model.dart';

class ListItemsCategories extends GetView<ItemsControllerImp> {
  const ListItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
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

class CategoriesModel extends GetView<ItemsControllerImp> {
  final CategoriesModelStatic categoriesModel;
  final int i;

  const CategoriesModel(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changecat(i, categoriesModel.categoriesId!);
        //controller.goToItems(controller.categories, i);
      },
      child: Column(
        children: [
          const SizedBox(height: 15),
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: controller.selecetedCat != i
                  ? null
                  : BoxDecoration(
                      color: AppColor.primarycolor,
                      borderRadius: BorderRadius.circular(10)),
              child: Text(
                "${categoriesModel.categoriesName}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}
