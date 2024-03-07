import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.items,
      this.selectedValue,
      this.onChanged,
      required this.hint});

  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T?>? onChanged;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(hint,
              style: const TextStyle(fontSize: 20, color: Colors.black)),
        ),
        value: selectedValue,
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.toString(),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                ))
            .toList()
        /*..insert(
              0,
              const DropdownMenuItem(
                  value: "en",
                  child: Text(
                    "English",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )))*/
        ,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: const Color(0xffF5F5F5),
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: 25,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          //width: 380, //double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(0, -10),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          //padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
