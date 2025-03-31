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
import 'package:news_app/features/auth/register_screen/register_cubit/register_cubit.dart';
import 'package:news_app/features/auth/register_screen/register_cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Form(
            key: formKey,
            child: BlocListener<RegisterCubit, RegisterStates>(
              listener: (context, state) {
                if (state is SuccessRegister) {
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.homeScreen);
                } else if (state is ErrorRegister) {
                  // Show error snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
                if (state is LoadingRegister) {
                  Column(
                    children: [
                      CircularProgressIndicator(strokeWidth: 2),
                      SizedBox(height: 8),
                      Text(
                        'Authenticating...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
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
                      hintText: "name_hint".tr(),
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    PrimaryTextfieldWidget(
                      width: width,
                      hintText: "email_hint".tr(),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Email";
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
                          return "Enter your password";
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
                      buttonText: "register".tr(),
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
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
                            context.read<RegisterCubit>().googleSignIn();
                          },
                          image: AppAssets.googleIcon,
                        ),
                      ],
                    ),
                    const SizedBox(height: 155),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "have_acc".tr(),
                          style: AppStyles.black16W500TextStyle.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "login_now".tr(),
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
