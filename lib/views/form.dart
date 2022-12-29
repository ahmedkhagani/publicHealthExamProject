import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/services/data_model.dart';
import 'package:project_fetp_form/services/database.dart';
import 'package:project_fetp_form/widgets/flushbar.dart';
import 'package:project_fetp_form/widgets/loading_button.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';
import 'package:project_fetp_form/widgets/text_field.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class FormI extends StatefulWidget {
  const FormI({Key? key}) : super(key: key);

  @override
  State<FormI> createState() => _FormIState();
}

class _FormIState extends State<FormI> {
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Apply Form',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: Center(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Please fill in the following form:',
                    style: getHeaderText(context),
                  ),
                ),
                SizedBox(height: getDeviceType(context, 25, 50, 75, 100)),
                CustomTextField(
                  hint: 'Name',
                  onChanged: (val) {
                    setState(() => FormData.name = val);
                  },
                ),
                getSizedboxHeight(context),
                CustomTextField(
                  hint: 'Email',
                  onChanged: (val) {
                    setState(() => FormData.email = val);
                  },
                ),
                getSizedboxHeight(context),
                CustomTextField(
                  hint: 'Qualifications',
                  onChanged: (val) {
                    setState(() => FormData.qualification = val);
                  },
                ),
                getSizedboxHeight(context),
                CustomTextField(
                  hint: 'Phone',
                  onChanged: (val) {
                    setState(() => FormData.phone = val);
                  },
                ),
                SizedBox(height: getDeviceType(context, 25, 50, 75, 100)),
                LoadingButton(
                    title: 'Next',
                    controller: _controller,
                    onPressed: () async {
                      if (FormData.name.isNotEmpty &&
                          FormData.email.isNotEmpty &&
                          FormData.qualification.isNotEmpty &&
                          FormData.phone.isNotEmpty) {
                        await getSuccess(_controller);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FormII(),
                          ),
                        );
                      } else {
                        getFlushbar(context, flushbarForm, _controller);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormII extends StatefulWidget {
  const FormII({Key? key}) : super(key: key);

  @override
  _FormIIState createState() => _FormIIState();
}

class _FormIIState extends State<FormII> {
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();
  final DatabaseService _fireStore = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Apply abstract',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: Center(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hint: 'Title',
                    onChanged: (val) {
                      setState(() => FormData.title = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Authors',
                    onChanged: (val) {
                      setState(() => FormData.author = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Background',
                    onChanged: (val) {
                      setState(() => FormData.background = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Objective',
                    onChanged: (val) {
                      setState(() => FormData.objective = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Method',
                    onChanged: (val) {
                      setState(() => FormData.method = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Result',
                    onChanged: (val) {
                      setState(() => FormData.result = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Discussion',
                    onChanged: (val) {
                      setState(() => FormData.discussion = val);
                    },
                  ),
                  getSizedboxHeight(context),
                  CustomTextField(
                    hint: 'Keyword',
                    onChanged: (val) {
                      setState(() => FormData.keyword = val);
                    },
                  ),
                  SizedBox(height: getDeviceType(context, 25, 50, 75, 100)),
                  LoadingButton(
                      title: 'Submit',
                      controller: _controller,
                      onPressed: () async {
                        if (FormData.title.isNotEmpty &&
                            FormData.author.isNotEmpty &&
                            FormData.background.isNotEmpty &&
                            FormData.objective.isNotEmpty &&
                            FormData.method.isNotEmpty &&
                            FormData.result.isNotEmpty &&
                            FormData.discussion.isNotEmpty &&
                            FormData.keyword.isNotEmpty) {
                          await getSuccess(_controller);
                          await _fireStore.addStudents(
                            FormData.name,
                            FormData.email,
                            FormData.qualification,
                            FormData.phone,
                            FormData.title,
                            FormData.author,
                            FormData.background,
                            FormData.objective,
                            FormData.method,
                            FormData.result,
                            FormData.discussion,
                            FormData.keyword,
                            FormData.score_01,
                            FormData.score_02,
                            FormData.score_03,
                            FormData.score_04,
                            FormData.score_05,
                            FormData.score_06,
                            FormData.score_07,
                            FormData.score_08,
                            FormData.score_09,
                            FormData.score_10,
                          );
                          int count = 0;
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        } else {
                          getFlushbar(context, flushbarForm, _controller);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
