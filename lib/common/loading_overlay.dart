import 'package:ayamku_admin/app/pages/global_component/common_loading.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.body
  });

  final bool isLoading;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return isLoading ? Stack(
        children: [
          body,

          Center(child: CircularProgressIndicator(color: primaryColor,)),
        ]
    ) : body;
  }
}
