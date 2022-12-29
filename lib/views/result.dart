import 'package:flutter/material.dart';
import 'package:project_fetp_form/services/database.dart';
import 'package:project_fetp_form/widgets/result_listview.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class Result extends StatelessWidget {
  final DatabaseService _fireStore = DatabaseService();

  Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Result',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: StreamBuilder(
          stream: _fireStore.studentCollection.snapshots(),
          builder: buildResultList,
        ),
      ),
    );
  }
}
