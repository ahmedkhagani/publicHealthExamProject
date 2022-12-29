import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/services/data_model.dart';
import 'package:project_fetp_form/services/database.dart';
import 'package:project_fetp_form/widgets/flushbar.dart';
import 'package:project_fetp_form/widgets/review_field.dart';
import 'package:project_fetp_form/widgets/rounded_loading_button.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class Abstract extends StatelessWidget {
  Abstract({Key? key}) : super(key: key);
  final DatabaseService _fireStore = DatabaseService();
  final RoundedLoadingButtonController _controller = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Abstracts',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: SizedBox(
              width: getDeviceType(context, 400, 500, 600, 650),
              child: Column(
                children: [
                  getAbstractFields(context, 'Title', StreamData.title),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Authors', StreamData.author),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Background', StreamData.background),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Objective', StreamData.objective),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Method', StreamData.method),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Result', StreamData.result),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Discussion', StreamData.discussion),
                  getSizedboxHeight(context),
                  getAbstractFields(context, 'Keyword', StreamData.keyword),
                  getSizedboxHeight(context),
                  const Divider(thickness: 2, color: Colors.white),
                  getSizedboxHeight(context),
                  SizedBox(
                    width: getDeviceType(context, 300, 350, 550, 600),
                    height: getDeviceType(context, 50, 60, 90, 100),
                    child: ReviewField(
                      onChanged: (val) {
                        if (Reviewer.reviewer_01) Reviewer.score_01 = int.parse(val);
                        if (Reviewer.reviewer_02) Reviewer.score_02 = int.parse(val);
                        if (Reviewer.reviewer_03) Reviewer.score_03 = int.parse(val);
                        if (Reviewer.reviewer_04) Reviewer.score_04 = int.parse(val);
                        if (Reviewer.reviewer_05) Reviewer.score_05 = int.parse(val);
                        if (Reviewer.reviewer_06) Reviewer.score_06 = int.parse(val);
                        if (Reviewer.reviewer_07) Reviewer.score_07 = int.parse(val);
                        if (Reviewer.reviewer_08) Reviewer.score_08 = int.parse(val);
                        if (Reviewer.reviewer_09) Reviewer.score_09 = int.parse(val);
                        if (Reviewer.reviewer_10) Reviewer.score_10 = int.parse(val);
                      },
                      hint: 'Submit Your Score',
                      onPressed: () async {
                        if (Reviewer.reviewer_01) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_01', Reviewer.score_01);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_02) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_02', Reviewer.score_02);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_03) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_03', Reviewer.score_03);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_04) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_04', Reviewer.score_04);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_05) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_05', Reviewer.score_05);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_06) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_06', Reviewer.score_06);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_07) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_07', Reviewer.score_07);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_08) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_08', Reviewer.score_08);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_09) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_09', Reviewer.score_09);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                        if (Reviewer.reviewer_10) {
                          await _fireStore.updateStudentData(StreamData.id, 'score_10', Reviewer.score_10);
                          await getSuccess(_controller);
                          getScoreFlushbar(context);
                        }
                      },
                      controller: _controller,
                    ),
                  ),
                  SizedBox(height: getDeviceType(context, 25, 50, 75, 100)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row getAbstractFields(BuildContext context, title, body) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getHeaderText(context),
        ),
        Container(
          width: getDeviceType(context, 300, 400, 500, 500),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(width: getDeviceType(context, 1, 1, 2, 2), color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            body,
            style: getBodyText(context),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
