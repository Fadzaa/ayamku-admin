import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class DropdownCategory extends StatelessWidget {
  const DropdownCategory({
    super.key,
    required this.categories,
    required this.selectedValue,
    required this.onChanged,
    this.color,
  });

  final List<String> categories;
  final Color? color;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 165,
        decoration: BoxDecoration(
          border: Border.all(color: blackColor50),
          borderRadius: BorderRadius.circular(15),
        ),
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          style: txtCaption.copyWith(color: blackColor),
          elevation: 1,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderRadius.circular(8),
          underline: Container(),
          items: categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(
                category,
                style: txtSecondaryTitle.copyWith(color: color ?? blackColor50),
              ),
            );
          }).toList(),
          hint: const Text("Pilih Kategori"),
          onChanged: onChanged,
          value: selectedValue.isEmpty ? null : selectedValue,
        ),
      ),
    );
  }
}
