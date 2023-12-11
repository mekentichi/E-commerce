import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/categories/add_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/function/validinput.dart';
import '../../../core/static/color.dart';
import '../../../widget/admin/customfromfield.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories Add'),
          backgroundColor: AppColor.secondycolor,
        ),
        body:HandlingDataView(statusrequest: controller.statusrequest, widget: GetBuilder<CategoriesAddController>(
          builder: (controller) => WillPopScope(
            onWillPop: () {
              return controller.myBack();
            },
            child: Form(
              key: controller.formstate,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Categories Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Categories Name',
                            label: null,
                            mycontroller: controller.categoriesname,
                            prefix: null,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 3, 30, 'name');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        controller.chooseImage("camera");
                        // showBottomSheet(
                        //     context: context,
                        //     builder: (context) => Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text('Choose Image'),
                        //             InkWell(
                        //               onTap: (){
                        //                 controller.chooseImage("camera");
                        //               },
                        //               child: Text("From Camera"),
                        //             ),
                        //             InkWell(
                        //               onTap: (){
                        //                 controller.chooseImage("galery");
                        //               },
                        //               child: Text("From Galery"),
                        //             ),
                        //           ],
                        //         ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.secondycolor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        child: const Text('Photo From Camera'),
                      ),
                    ),
                    // if (controller.file != null)
                    //   Container(
                    //       height: 100, child: Image.file(controller.file!)),
                    // const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        controller.chooseImage("galery");
                        // showBottomSheet(
                        //     context: context,
                        //     builder: (context) => Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text('Choose Image'),
                        //             InkWell(
                        //               onTap: (){
                        //                 controller.chooseImage("camera");
                        //               },
                        //               child: Text("From Camera"),
                        //             ),
                        //             InkWell(
                        //               onTap: (){
                        //                 controller.chooseImage("galery");
                        //               },
                        //               child: Text("From Galery"),
                        //             ),
                        //           ],
                        //         ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.secondycolor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        child: const Text('Photo From Galery'),
                      ),
                    ),
                    if (controller.file != null)
                      Container(
                          height: 100, child: Image.file(controller.file!)),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        controller.addItems();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.secondycolor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        child: const Text('Confirme'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),) );
  }
}
