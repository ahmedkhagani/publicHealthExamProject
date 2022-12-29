import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';

class HomeButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  const HomeButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getDeviceType(context, 4, 4, 8, 8)),
      child: SizedBox(
        height: getButtonHeight(context),
        width: getButtonWidth(context),
        child: TextButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                width: getDeviceType(context, 1, 1, 2, 2),
                color: Colors.white,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Center(child: child),
        ),
      ),
    );
  }
}
