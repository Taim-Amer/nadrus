import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/assets.dart';
import 'package:nadros/core/utils/font.dart';
import 'package:nadros/features/auth/presentation/login_cubit/login_cubit.dart';

class CustomInputsLogin extends StatelessWidget {
  const CustomInputsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اسم المستخدم",
          style: TextStyles.font16kDarkBlue500,
        ),
        4.verticalSpace,
        TextFormField(
          validator: (value) => AppFunctions.validateEmptyText('اسم المستخدم', value),
          controller:
          context.read<LoginCubit>().textEditingControllerUserName,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(9),
              child: SvgPicture.asset(
                SvgAssets.user,
              ),
            ),
            hintText: "أدخل اسم المستخدم",
            hintStyle: TextStyles.font14Gray400,
          ),
        ),
        35.verticalSpace,
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 450),
          crossFadeState: context.read<LoginCubit>().isInitialLoginSuccess
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "كلمة المرور",
                style: TextStyles.font16kDarkBlue500,
              ),
              4.verticalSpace,
              TextField(
                controller:
                    context.read<LoginCubit>().textEditingControllerPassword,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(9),
                    child: SvgPicture.asset(
                      SvgAssets.lock11,
                    ),
                  ),
                  hintText: "أدخل كلمة المرور",
                  hintStyle: TextStyles.font14Gray400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
