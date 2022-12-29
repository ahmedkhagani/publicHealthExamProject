import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/views/form.dart';
import 'package:project_fetp_form/views/result.dart';
import 'package:project_fetp_form/views/review/auth.dart';
import 'package:project_fetp_form/widgets/icons.dart';
import 'package:project_fetp_form/widgets/home_button.dart';
import 'package:project_fetp_form/widgets/top_nav.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigationBar(context),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/background.png"),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(backgroundColor.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeSection(
                  title: "Researcher Section",
                  body: 'Submit your abstract information in this field ',
                  onpressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FormI())),
                ),
                getSizedboxHeight(context),
                HomeSection(
                  title: "Reviewer Section",
                  body: 'You can review and make a score for each abstract from this section',
                  onpressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Auth())),
                ),
                getSizedboxHeight(context),
                HomeSection(
                  title: "Result Section",
                  body: 'Researchers, you can view the mean score for your submited astracts here ',
                  onpressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Result())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  final String title;
  final String body;
  final Function()? onpressed;
  const HomeSection({
    Key? key,
    required this.title,
    required this.body,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: getHeaderText(context),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              body,
              style: getBodyText(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: HomeButton(
              onPressed: onpressed,
              child: getIcon(context),
            ),
          ),
        ],
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  final Widget child;
  const BorderedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getDeviceType(context, 8, 10, 16, 16)),
      decoration: BoxDecoration(
        border: Border.all(width: getDeviceType(context, 1, 1, 2, 2), color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      width: getCardWidth(context),
      height: getCardHeight(context),
      child: child,
    );
  }
}
