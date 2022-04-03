import 'package:flutter/material.dart';

import '../const.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: h * 0.03,
        ),
        Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Icon(
                Icons.check_box_rounded,
                color: Colors.white,
              )),
              SizedBox(
                width: 10,
              ),
              Container(
                width: w * 0.7,
                child: Text(
                  'I confirm that I have read, understand and agree to the terms and conditions presented above.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: h * 0.02,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h * 0.03,
        ),
      ],
    );
  }
}
