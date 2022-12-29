import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getDeviceType(context, 200, 250, 400, 500),
      height: getDeviceType(context, 20, 40, 45, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hint,
            style: getHeaderText(context),
          ),
          SizedBox(
            width: getDeviceType(context, 120, 150, 250, 300),
            height: getDeviceType(context, 20, 25, 30, 35),
            child: TextField(
              onChanged: onChanged,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              style: getHeaderText(context).copyWith(color: backgroundColor),
              decoration: getInputDecoration(context),
            ),
          ),
        ],
      ),
    );
  }
}
