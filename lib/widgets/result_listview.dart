import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/views/home.dart';

Widget buildResultList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    student['name'],
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
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Mean Score ' +
                        getMeanScore(
                          student['score_01'],
                          student['score_02'],
                          student['score_03'],
                          student['score_04'],
                          student['score_05'],
                          student['score_06'],
                          student['score_07'],
                          student['score_08'],
                          student['score_09'],
                        ),
                    style: getHeaderText(context),
                  ),
                ),
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

String getMeanScore(
  int score_01,
  int score_02,
  int score_03,
  int score_04,
  int score_05,
  int score_06,
  int score_07,
  int score_08,
  int score_09,
) {
  double mean = (score_01 + score_02 + score_03 + score_04 + score_05 + score_06 + score_07 + score_08 + score_09) / 9;
  return mean.ceil().toString();
}
