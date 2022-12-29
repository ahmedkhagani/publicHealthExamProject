import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';

getFlushbar(BuildContext context, String message, RoundedLoadingButtonController controller) async {
  Flushbar(
    titleText: Text(
      'Error',
      style: getHeaderText(context),
    ),
    messageText: Text(
      message,
      style: getHeaderText(context),
    ),
    message: message,
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
    duration: const Duration(seconds: 2),
    shouldIconPulse: false,
    icon:  Icon(
      Icons.error,
      size: getDeviceType(context, 15, 20, 30, 30),
      color: Colors.white,
    ),
  ).show(context);
  controller.error();
  await Future.delayed(const Duration(seconds: 2), () {});
  controller.reset();
}

getSuccess(RoundedLoadingButtonController controller) async {
  controller.success();
  await Future.delayed(const Duration(seconds: 1), () {});
  controller.reset();
}

getScoreFlushbar(BuildContext context) async {
  Flushbar(
    titleText: Text(
      'Success',
      style: getHeaderText(context),
    ),
    messageText: Text(
      'Score has been updated successfully',
      style: getHeaderText(context),
    ),
    message: 'Score has been updated successfully',
    forwardAnimationCurve: Curves.decelerate,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
    duration: const Duration(seconds: 2),
    shouldIconPulse: false,
    icon: const Icon(
      Icons.error,
      size: 30,
      color: Colors.white,
    ),
  ).show(context);
  await Future.delayed(const Duration(seconds: 2), () {});
}
