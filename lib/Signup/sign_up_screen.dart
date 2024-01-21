import 'package:education/responsive.dart';
import 'package:flutter/material.dart';
import '../align_body.dart';
import 'components/sign_up_form.dart';
import 'components/sign_up_top_image.dart';
import '../constants.dart';

class SignUpScreen extends StatelessWidget {
  final int index;
  const SignUpScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignBody(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileSignupScreen(index: index),
          desktop: Row(
            children: [
              Expanded(
                child: SignUpScreenTopImage(index: index),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: SignUpForm(index: index),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  final int index;
  const MobileSignupScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SignUpScreenTopImage(index: index),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(index: index),
            ),
            const Spacer(),
          ],
        ),
        // const SocalSignUp()
      ],
    );
  }
}