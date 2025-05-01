import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/features/homeworks/data/models/homeworks_model.dart';
import 'package:nadros/features/homeworks/data/repo/homeworks_repo.dart';
import 'package:nadros/features/homeworks/data/repo/homeworks_repo_impl.dart';

class HomeworksController extends GetxController{
  final HomeworksRepo _homeworksRepo = HomeworksRepoImpl();
  final pageController = PageController(viewportFraction: .8);

  @override
  void onInit() {
    getHomeworks();
    super.onInit();
  }

  RequestState getHomeworksApiStatus = RequestState.begin;

  HomeworksModel homeworksModel = HomeworksModel.skeleton;

  Future<void> getHomeworks() async {
    getHomeworksApiStatus = RequestState.loading;
    update();
    var response = await _homeworksRepo.getHomeworks();
    if (response is DataSuccess) {
      homeworksModel = response.data!;
      getHomeworksApiStatus = homeworksModel.data!.isEmpty
          ? RequestState.empty
          : RequestState.success;
      update();
    } else if (response is DataFailed) {
      AppFunctions.customToast(message: response.error!.toString());
      getHomeworksApiStatus = RequestState.error;
      update();
    }
  }
}