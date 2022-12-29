import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/services/data_model.dart';
import 'package:project_fetp_form/views/review/students_list.dart';
import 'package:project_fetp_form/widgets/flushbar.dart';
import 'package:project_fetp_form/widgets/review_field.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class Auth extends StatelessWidget {
  Auth({Key? key}) : super(key: key);
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Authentication',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please fill in the password for your assigned Role',
                style: getHeaderText(context),
              ),
              getSizedboxHeight(context),
              SizedBox(
                width: getDeviceType(context, 250, 300, 450, 500),
                height: getDeviceType(context, 50, 60, 90, 100),
                child: ReviewField(
                  controller: _controller,
                  hint: 'Password',
                  onChanged: (val) => Reviewer.temp = val,
                  onPressed: () async {
                    if (Reviewer.temp == Reviewer.password_01) Reviewer.reviewer_01 = true;
                    if (Reviewer.temp == Reviewer.password_02) Reviewer.reviewer_02 = true;
                    if (Reviewer.temp == Reviewer.password_03) Reviewer.reviewer_03 = true;
                    if (Reviewer.temp == Reviewer.password_04) Reviewer.reviewer_04 = true;
                    if (Reviewer.temp == Reviewer.password_05) Reviewer.reviewer_05 = true;
                    if (Reviewer.temp == Reviewer.password_06) Reviewer.reviewer_06 = true;
                    if (Reviewer.temp == Reviewer.password_07) Reviewer.reviewer_07 = true;
                    if (Reviewer.temp == Reviewer.password_08) Reviewer.reviewer_08 = true;
                    if (Reviewer.temp == Reviewer.password_09) Reviewer.reviewer_09 = true;
                    if (Reviewer.temp == Reviewer.password_10) Reviewer.reviewer_10 = true;

                    if (Reviewer.reviewer_01 ||
                        Reviewer.reviewer_02 ||
                        Reviewer.reviewer_03 ||
                        Reviewer.reviewer_04 ||
                        Reviewer.reviewer_05 ||
                        Reviewer.reviewer_06 ||
                        Reviewer.reviewer_07 ||
                        Reviewer.reviewer_08 ||
                        Reviewer.reviewer_09 ||
                        Reviewer.reviewer_10) {
                      await getSuccess(_controller);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StudentsList(),
                        ),
                      );
                    } else {
                      getFlushbar(context, flushbarAuth, _controller);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void resetReviwer() {
  if (Reviewer.reviewer_01) {
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_02) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_03) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_04) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_05) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_06) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_07) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_08) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_09 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_09) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_10 = false;
  }
  if (Reviewer.reviewer_10) {
    Reviewer.reviewer_01 = false;
    Reviewer.reviewer_02 = false;
    Reviewer.reviewer_03 = false;
    Reviewer.reviewer_04 = false;
    Reviewer.reviewer_05 = false;
    Reviewer.reviewer_06 = false;
    Reviewer.reviewer_07 = false;
    Reviewer.reviewer_08 = false;
    Reviewer.reviewer_09 = false;
  }
}
