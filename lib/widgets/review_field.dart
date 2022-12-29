import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/widgets/icons.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';

class ReviewField extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;
  final Function()? onPressed;
  final RoundedLoadingButtonController controller;

  const ReviewField({
    Key? key,
    required this.onChanged,
    required this.hint,
    required this.onPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: getDeviceType(context, 1, 1, 2, 2), color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              hint,
              style: getHeaderText(context),
            ),
          ),
          Center(
            child: SizedBox(
              width: getDeviceType(context, 120, 150, 250, 300),
              height: getDeviceType(context, 20, 25, 30, 35),
              child: TextField(
                onChanged: onChanged,
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                style: getHeaderText(context).copyWith(color: backgroundColor),
                decoration: getInputDecoration(context),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 35,
              child: RoundedLoadingButton(
                elevation: 0,
                width: getDeviceType(context, 30, 40, 50, 60),
                height: getDeviceType(context, 20, 30, 40, 50),
                errorColor: Colors.white,
                successColor: Colors.white,
                valueColor: backgroundColor,
                borderRadius: 5,
                color: backgroundColor,
                loaderSize: getDeviceType(context, 5, 8, 15, 15),
                controller: controller,
                onPressed: onPressed,
                child: getIcon(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
