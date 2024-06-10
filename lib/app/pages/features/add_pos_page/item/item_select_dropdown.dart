import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemSelectDropdown extends StatelessWidget {
  const ItemSelectDropdown({super.key, required this.titleTxt, required this.hintTxt, required this.selectedValue, required this.dropdownList, required this.onChanged});

  final String titleTxt, hintTxt, selectedValue;
  final List<String> dropdownList;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleTxt,
            style: txtFormTitle.copyWith(color:  blackColor),
          ),
          SizedBox(height: 10),
          Container(
            height: 42,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: screenWidth,
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
              items: dropdownList.map((String selectList) {
                return DropdownMenuItem<String>(
                  value: selectList,
                  child: Text(
                    selectList,
                    style: txtSecondaryTitle.copyWith(color: blackColor50),
                  ),
                );
              }).toList(),
              hint: Text(hintTxt),
              onChanged: onChanged,
              value: selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}
