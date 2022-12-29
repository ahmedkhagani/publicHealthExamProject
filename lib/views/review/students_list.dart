import 'package:flutter/material.dart';
import 'package:project_fetp_form/services/database.dart';
import 'package:project_fetp_form/widgets/students_listview.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class StudentsList extends StatelessWidget {
  final DatabaseService _fireStore = DatabaseService();

  StudentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Researchers',
      color: Colors.white,
      child: Scaffold(
        appBar: topNavigationBar(context),
        body: StreamBuilder(
          stream: _fireStore.studentCollection.snapshots(),
          builder: buildUserList,
        ),
      ),
    );
  }
}
