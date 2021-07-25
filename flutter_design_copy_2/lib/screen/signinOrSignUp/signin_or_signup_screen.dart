import 'package:flutter/material.dart';
import 'package:flutter_design_copy_2/components/primary_button.dart';
import 'package:flutter_design_copy_2/constants.dart';
import 'package:flutter_design_copy_2/screen/chats/chats_screen.dart';

class SigninOrSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? "assets/images/Logo_light.png"
                      : "assets/images/Logo_dark.png",
                  height: 146),
              Spacer(),
              PrimaryButton(
                text: "Sign In",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Sign Up",
                press: () {},
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
