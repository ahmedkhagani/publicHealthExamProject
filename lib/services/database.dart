import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');
  Future<void> addStudents(
    String name,
    String email,
    String qualification,
    String phone,
    String title,
    String author,
    String background,
    String objective,
    String method,
    String result,
    String discussion,
    String keyword,
    int score_01,
    int score_02,
    int score_03,
    int score_04,
    int score_05,
    int score_06,
    int score_07,
    int score_08,
    int score_09,
    int score_10,
  ) {
    return studentCollection.add({
      'name': name,
      'email': email,
      'qualification': qualification,
      'phone': phone,
      'title': title,
      'author': author,
      'background': background,
      'objective': objective,
      'method': method,
      'result': result,
      'discussion': discussion,
      'keyword': keyword,
      'score_01': score_01,
      'score_02': score_02,
      'score_03': score_03,
      'score_04': score_04,
      'score_05': score_05,
      'score_06': score_06,
      'score_07': score_07,
      'score_08': score_08,
      'score_09': score_09,
      'score_10': score_10,
    });
  }

  Future updateStudentData(
    var id,
    String docScore,
    int score,
    // int score_01,
    // int score_02,
    // int score_03,
    // int score_04,
    // int score_05,
    // int score_06,
    // int score_07,
    // int score_08,
    // int score_09,
    // int score_10,
  ) async {
    return await studentCollection.doc(id).update({
      docScore: score,
      // 'score_01': score_01,
      // 'score_02': score_02,
      // 'score_03': score_03,
      // 'score_04': score_04,
      // 'score_05': score_05,
      // 'score_06': score_06,
      // 'score_07': score_07,
      // 'score_08': score_08,
      // 'score_09': score_09,
      // 'score_10': score_10,
    });
  }
}
