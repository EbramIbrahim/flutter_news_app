import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styling/app_assets.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_styles.dart';
import 'package:news_app/core/widget/primary_button_widget.dart';
import 'package:news_app/core/widget/primary_textfield_widget.dart';
import 'package:news_app/core/widget/sized_container_box.dart';
import 'package:news_app/features/auth/login_screen/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/login_screen/login_cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is SuccessLogin) {
              GoRouter.of(context).pushReplacementNamed(AppRouter.homeScreen);
            } else if (state is ErrorRLogin) {
              // Show error snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is LoadingLogin) {
              Column(
                children: [
                  CircularProgressIndicator(strokeWidth: 2),
                  SizedBox(height: 8),
                  Text('Loging...', style: TextStyle(color: Colors.grey)),
                ],
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width:
                            orientation == Orientation.portrait ? 41.w : 61.w,
                        height:
                            orientation == Orientation.portrait ? 41.h : 100.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        "welcome".tr(),
                        style: AppStyles.headLineTextStyle,
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryTextfieldWidget(
                      width: width,
                      hintText: "email_hint".tr(),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "email_hint".tr();
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    PrimaryTextfieldWidget(
                      width: width,
                      hintText: "password_hint".tr(),
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password_hint".tr();
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        } else {
                          return null;
                        }
                      },
                      isPassword: isPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    PrimaryButtonWidget(
                      width: width,
                      buttonText: "login".tr(),
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: width * 0.3, child: Divider()),
                        const SizedBox(width: 12),
                        Text(
                          "login_with".tr(),
                          style: AppStyles.black16W500TextStyle.copyWith(
                            color: AppColors.lightGrayColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(width: width * 0.3, child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedContainerBox(
                          onTap: () {
                            context.read<LoginCubit>().googleSignIn();
                          },
                          image: AppAssets.googleIcon,
                        ),
                      ],
                    ),
                    const SizedBox(height: 155),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "don't_have_acc".tr(),
                          style: AppStyles.black16W500TextStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "register_now".tr(),
                              style: AppStyles.black16W500TextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
