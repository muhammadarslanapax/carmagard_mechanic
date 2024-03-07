import 'package:carmagard/Provider/resetpasswordprovider.dart';
import 'package:carmagard/View/Auth/User/forgot_password_otp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carmagard/View/formwidget.dart';
import 'package:carmagard/View/style.dart';

import '../../../Constant/utility_function.dart';
import '../../../Provider/authprovider.dart';
import '../../../Widget/custom_snackbar.dart';

class ForgetPassword2 extends ConsumerStatefulWidget {
  const ForgetPassword2({super.key});

  @override
  ConsumerState<ForgetPassword2> createState() => _ForgetPassword2State();
}

class _ForgetPassword2State extends ConsumerState<ForgetPassword2> with Ui {
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(resetPasswordProvider, (previous, next) {
      if (!next.isLoading && next.hasError) {
        var snackBar = customSnackBar(errorBuilder(next.error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      if (next.value?.success == true && !next.isLoading) {
        navW(context, const ForgotPasswordOtp());
      }
    });
    return innnerLayout(Column(
      crossAxisAlignment: cStart,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/login.svg',
            width: width(context),
            fit: BoxFit.fill,
          ),
        ),
        input(black47, 28, 'Reset Password', w700),

        hspacer(25),
        TextFieldWithColumn(
          hint: "Email Address",
          controller: emailController,
          keyType: TextInputType.emailAddress,
        ),
        hspacer(MediaQuery.sizeOf(context).height * 0.22),
        GestureDetector(
            onTap: () async {
              print(emailController.text);
              await ref
                  .read(resetPasswordProvider.notifier)
                  .resetPassword(emailController.text.trim());
            },
            child: button(
                ref.watch(resetPasswordProvider).isLoading
                    ? buttonLoading()
                    : commonText('Reset Password', white),
                green)),

        // Center(child: SvgPicture.asset('assets/fingerprint.svg'))
      ],
    ));
  }
}
