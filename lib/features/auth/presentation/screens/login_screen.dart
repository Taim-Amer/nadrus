import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/injector.dart';
import 'package:nadros/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:nadros/features/auth/presentation/widgets/login_widgets/custom_elevated_button.dart';
import 'package:nadros/features/auth/presentation/widgets/login_widgets/custom_header_login.dart';
import 'package:nadros/features/auth/presentation/widgets/login_widgets/custom_inputs_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<LoginCubit>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
            key: context.read<LoginCubit>().formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      106.verticalSpace,
                      const CustomHeaderLogin(),
                      const CustomInputsLogin(),
                      80.verticalSpace,
                      state is LoginLoading
                          ? const Center(
                              child: SpinKitCircle(
                                color: TColors.primary,
                              ),
                            )
                          : CustomElevetadButton(
                        title: "متابعة",
                        onPressed: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<LoginCubit>()
                                .isInitialLoginSuccess
                                ? context
                                .read<LoginCubit>()
                                .sendLoginRequest()
                                : context
                                .read<LoginCubit>()
                                .sendInitLoginRequest();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
