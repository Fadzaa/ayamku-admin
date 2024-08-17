import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

Widget commonLoading() {
  return Center(
    child: Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
        ),
      ),
    ),
  );
}