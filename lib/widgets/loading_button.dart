import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';

class LoadingButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final RoundedLoadingButtonController controller;

  const LoadingButton({Key? key, required this.title, required this.onPressed, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      elevation: 0,
      height: getLoadingButtonHeight(context),
      width: getLoadingButtonWidth(context),
      errorColor: Colors.white,
      successColor: Colors.white,
      valueColor: backgroundColor,
      borderRadius: 15,
      loaderSize: getDeviceType(context, 10, 15, 25, 25),
      color: backgroundColor,
      controller: controller,
      onPressed: onPressed,
      child: Text(
        title,
        style: getHeaderText(context),
      ),
    );
  }
}
