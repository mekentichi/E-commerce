import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

import '../static/color.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final Widget? label;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownselectedname;
  final TextEditingController dropdownselectedID;

  const CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropdownselectedname,
      required this.dropdownselectedID, this.label});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownselectedname.text = selectedListItem.name;
          widget.dropdownselectedID.text = selectedListItem.value!;
          print(widget.dropdownselectedID);
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownselectedname,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: widget.label,
          hintText: widget.dropdownselectedname.text == ""
              ? widget.title
              : widget.dropdownselectedname.text,
          // suffixIcon: prefix,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: AppColor.secondycolor,
              ))),
    );
  }
}
