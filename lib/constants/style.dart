import 'package:flutter/material.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';

const Color backgroundColor = Color(0xFF324161);
const String flushbarForm = 'Please Fill All of the above Fields';
const String flushbarAuth = 'Please enter the correct password for your assigned role';
const String flushbarEmail = 'A Confirmatory message was sent to your submitted email';

double getButtonHeight(BuildContext context) => getDeviceType(context, 25, 28, 30, 35);
double getButtonWidth(BuildContext context) => getDeviceType(context, 30, 35, 40, 50);

double getLoadingButtonHeight(BuildContext context) => getDeviceType(context, 30, 35, 50, 50);
double getLoadingButtonWidth(BuildContext context) => getDeviceType(context, 65, 80, 120, 120);

double getCardWidth(BuildContext context) => getDeviceType(context, 300, 400, 450, 500);
double getCardHeight(BuildContext context) => getDeviceType(context, 100, 130, 150, 160);

getSizedboxHeight(BuildContext context) {
  return SizedBox(
    height: getDeviceType(context, 10, 15, 20, 25),
  );
}

TextStyle getHeaderText(BuildContext context) {
  return TextStyle(fontSize: getDeviceType(context, 10, 12, 16, 18), fontWeight: FontWeight.bold);
}

TextStyle getBodyText(BuildContext context) {
  return TextStyle(fontSize: getDeviceType(context, 10, 12, 14, 16), fontWeight: FontWeight.normal);
}

InputDecoration getInputDecoration(BuildContext context) {
  return const InputDecoration(
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
      borderSide: BorderSide(color: Colors.white, width: 3),
    ),
    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
  );
}
