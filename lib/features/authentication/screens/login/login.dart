import 'package:ecommerce_using_flutter/common/styles/spacing_styles.dart';
import 'package:ecommerce_using_flutter/common/widgets/login_signup.dart';
import 'package:ecommerce_using_flutter/common/widgets/social_buttons.dart';
import 'package:ecommerce_using_flutter/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_using_flutter/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_using_flutter/utils/constants/sizes.dart';
import 'package:ecommerce_using_flutter/utils/constants/text_strings.dart';
import 'package:ecommerce_using_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
      // body: const Text('data'),
    );
  }
}
