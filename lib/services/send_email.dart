import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future sendEmail(String email) async {
  String username = 'username@gmail.com';
  String password = 'password';
  final smtpServer = gmailSaslXoauth2(username, password);
  final message = Message()
    ..from = Address(username, 'CDC Iraq')
    ..recipients.add(email)
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.';
  await send(message, smtpServer);
}
