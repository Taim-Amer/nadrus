import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/features/homeworks/data/models/homeworks_model.dart';
import 'package:nadros/features/homeworks/data/repo/homeworks_repo.dart';
import 'package:nadros/features/homeworks/data/repo/homeworks_repo_impl.dart';

class HomeworksController extends GetxController{
  final HomeworksRepo _homeworksRepo = HomeworksRepoImpl();
  final pageController = PageController(viewportFraction: .8);
  final dateController = TextEditingController();

  @override
  void onInit() {
    final today = DateTime.now();
    dateController.text = DateFormat('yyyy-MM-dd').format(today);
    getHomeworks(dateController.text);
    getTodayHomeworks(dateController.text);
    super.onInit();
  }

  RequestState getHomeworksApiStatus = RequestState.begin;
  RequestState getTodayHomeworksApiStatus = RequestState.begin;

  HomeworksModel homeworksModel = HomeworksModel.skeleton;
  HomeworksModel homeworksTodayModel = HomeworksModel.skeleton;

  Future<void> getHomeworks(String? date) async {
    getHomeworksApiStatus = RequestState.loading;
    update();
    var response = await _homeworksRepo.getHomeworks(dateController.text.toString());
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

  Future<void> getTodayHomeworks(String? date) async {
    getTodayHomeworksApiStatus = RequestState.loading;
    update();
    var response = await _homeworksRepo.getHomeworks(dateController.text.toString());
    if (response is DataSuccess) {
      homeworksTodayModel = response.data!;
      getTodayHomeworksApiStatus = homeworksTodayModel.data!.isEmpty
          ? RequestState.empty
          : RequestState.success;
      update();
    } else if (response is DataFailed) {
      AppFunctions.customToast(message: response.error!.toString());
      getTodayHomeworksApiStatus = RequestState.error;
      update();
    }
  }

}