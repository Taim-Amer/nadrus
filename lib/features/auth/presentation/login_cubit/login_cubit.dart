import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_router.dart';
import 'package:nadros/core/utils/cache_helper.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/features/auth/data/models/login_model.dart';
import 'package:nadros/features/auth/data/repo/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authLoginRepoImpl) : super(LoginInitial());
  final AuthRepoImpl authLoginRepoImpl;

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerUserName = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  bool isInitialLoginSuccess = false;
  void sendInitLoginRequest() async {
    emit(LoginLoading());
    final respose = await authLoginRepoImpl.initialLogin(
      loginInitialRequest: LoginInitialRequest(
        username: textEditingControllerUserName.text,
        provider: 'parents',
      ),
    );
    if(respose is DataSuccess){
      isInitialLoginSuccess = true;
      await cache.write(CacheHelper.kTenantId, respose.data!.initialLogineData.tenantId);
      emit(LoginSuccess());
    } else if(respose is DataFailed){
      Get.snackbar(
        'خطأ في تسجيل الدخول',
        respose.data!.message.toString(),
        backgroundColor: Colors.red,
        colorText: TColors.white,
      );
      emit(LoginFailure());
    }
  }

  void sendLoginRequest() async {
    emit(LoginLoading());
    final respose = await authLoginRepoImpl.login(
      loginRequest: LoginRequest(
        password: textEditingControllerPassword.text,
        username: textEditingControllerUserName.text,
        provider: 'parents',
      ),
    );
    if(respose is DataSuccess){
      isInitialLoginSuccess = true;
      cache.write(CacheHelper.token, respose.data!.data.accessToken);
      emit(LoginSuccess());
      Get.offAllNamed(AppRouter.kNavigationMenu);
    } else if(respose is DataFailed){
      Get.snackbar(
        'خطأ في تسجيل الدخول',
        respose.data!.message.toString(),
        backgroundColor: Colors.red,
        colorText: TColors.white,
      );
      emit(LoginFailure());
    }
  }
}
