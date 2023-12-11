import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/items/add_controller.dart';
import '../../../controller/admin/items/edit_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/function/customdropdownsearch.dart';
import '../../../core/function/validinput.dart';
import '../../../core/static/color.dart';
import '../../../widget/admin/customfromfield.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ProductEditController controller = Get.put(ProductEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items Edit'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: HandlingDataView(statusrequest: controller.statusrequest, widget: GetBuilder<ProductEditController>(
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
                            "Items Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Name',
                            label: null,
                            mycontroller: controller.itemsname,
                            prefix: null,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 3, 30, 'name');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Items Description",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Description',
                            label: null,
                            mycontroller: controller.itemsdes,
                            prefix: null,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 3, 100, 'description');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Items Price",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Price',
                            label: null,
                            mycontroller: controller.itemsprice,
                            prefix: null,
                            type: TextInputType.number,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 1, 30, 'price');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Items Count",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Count',
                            label: null,
                            mycontroller: controller.itemscount,
                            prefix: null,
                            type: TextInputType.number,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 1, 30, 'count');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Items Discount",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Discount',
                            label: null,
                            mycontroller: controller.itemsdiscount,
                            prefix: null,
                            type: TextInputType.number,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 1, 30, 'discount');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Items Active",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomFormFieldCat(
                            hint: 'Items Active',
                            label: null,
                            mycontroller: controller.itemsactive,
                            prefix: null,
                            type: TextInputType.number,
                            obscureText: false,
                            valid: (String? val) {
                              return validInput(val!, 1, 30, 'active');
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Row(
                    //   children: [
                    //     const Expanded(
                    //       flex: 1,
                    //       child: Text(
                    //         "Categorie Id",
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ),
                    //     // Expanded(
                    //     //   flex: 3,
                    //     //   child: CustomFormFieldCat(
                    //     //     hint: 'Categorie Id',
                    //     //     label: null,
                    //     //     mycontroller: controller.catid,
                    //     //     prefix: null,
                    //     //     type: TextInputType.number,
                    //     //     obscureText: false,
                    //     //     valid: (String? val) {
                    //     //       return validInput(val!, 1, 30, 'active');
                    //     //     },
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const  Expanded(
                          flex: 1,
                          child: Text(
                            "Choose Categories",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CustomDropDownSearch(label: const Text("Choose Categories"),dropdownselectedID: controller.dropdownid, dropdownselectedname: controller.dropdownname, listdata: controller.dropdownlist, title: 'Choose Categories',)),
                      ],
                    ),

                    // CustomDropDownSearch(label: Text("Choose Categories"),dropdownselectedID: controller.dropdownid, dropdownselectedname: controller.dropdownname, listdata: controller.dropdownlist, title: 'Choose Categories',),
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
                        controller.editItems();
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
        ),));
  }
}


