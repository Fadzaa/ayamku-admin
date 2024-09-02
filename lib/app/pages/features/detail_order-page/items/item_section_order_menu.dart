import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class ItemSectionOrderMenu extends StatelessWidget {
  const ItemSectionOrderMenu({super.key, required this.image, required this.menuName, required this.price, required this.quantity});

  final String image, menuName, price, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        quantity,
                        style: txtSecondaryTitle,
                      ), // count
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "x",
                        style: txtSecondaryTitle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    menuName,
                    style:
                    txtSecondaryTitle.copyWith(color: blackColor30),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Pedas",
                    style: txtSecondaryTitle,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "+",
                    style: txtSecondaryTitle,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Es teh",
                    style: txtSecondaryTitle,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: txtSecondaryTitle,
          )
        ],
      ),
    );
  }
}