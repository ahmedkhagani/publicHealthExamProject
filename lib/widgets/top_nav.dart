import 'package:flutter/material.dart';
import 'package:project_fetp_form/constants/style.dart';
import 'package:project_fetp_form/helpers/responsiveness.dart';
import 'package:project_fetp_form/views/home.dart';

AppBar topNavigationBar(BuildContext context) => AppBar(
      toolbarHeight: getDeviceType(context, 75, 100, 120, 150),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home())),
            child: Text(
              'FETP Iraq',
              style: TextStyle(fontSize: getDeviceType(context, 16, 20, 25, 30), fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
          getSizedboxHeight(context),
          Divider(
            thickness: getDeviceType(context, 1, 1, 2, 2),
            color: Colors.white,
            indent: 75,
            endIndent: 75,
          ),
        ],
      ),
    );
