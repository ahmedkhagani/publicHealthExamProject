import 'package:flutter/material.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';

Icon getIcon(BuildContext context) {
  return Icon(
    Icons.arrow_forward_rounded,
    color: Colors.white,
    size: getDeviceType(context, 15, 20, 25, 25),
  );
}
