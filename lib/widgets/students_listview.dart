import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/services/data_model.dart';
import 'package:project_fetp_form/views/home.dart';
import 'package:project_fetp_form/views/review/abstract.dart';

Widget buildUserList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.hasData) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        DocumentSnapshot student = snapshot.data!.docs[index];
        return Center(
          child: BorderedContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    student.id,
                    style: getHeaderText(context),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    student['email'],
                    style: getBodyText(context),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      StreamData.id = student.id;
                      StreamData.name = student['name'];
                      StreamData.email = student['email'];
                      StreamData.qualification = student['qualification'];
                      StreamData.phone = student['phone'];
                      StreamData.title = student['title'];
                      StreamData.author = student['author'];
                      StreamData.background = student['background'];
                      StreamData.objective = student['objective'];
                      StreamData.method = student['method'];
                      StreamData.result = student['result'];
                      StreamData.discussion = student['discussion'];
                      StreamData.keyword = student['keyword'];
                      StreamData.score_01 = student['score_01'];
                      StreamData.score_02 = student['score_02'];
                      StreamData.score_03 = student['score_03'];
                      StreamData.score_04 = student['score_04'];
                      StreamData.score_05 = student['score_05'];
                      StreamData.score_06 = student['score_06'];
                      StreamData.score_07 = student['score_07'];
                      StreamData.score_08 = student['score_08'];
                      StreamData.score_09 = student['score_09'];
                      StreamData.score_10 = student['score_10'];
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Abstract()));
                    },
                    child: Text(
                      'View',
                      style: TextStyle(fontSize: getDeviceType(context, 9, 10, 12, 14), color: Colors.white),
                    ),
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
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return getSizedboxHeight(context);
      },
    );
  } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
    // Handle no data
    return const Center(
      child: Text("No users found."),
    );
  } else {
    // Still loading
    return const Center(child: CircularProgressIndicator());
  }
}
