import 'package:get/get.dart';
import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/features/subjects/data/models/subjects_model.dart';
import 'package:nadros/features/subjects/data/repo/subjects_repo.dart';
import 'package:nadros/features/subjects/data/repo/subjects_repo_impl.dart';

class SubjectsController extends GetxController{
  final SubjectsRepo _subjectsRepo = SubjectsRepoImpl();

  @override
  void onInit() {
    getSubjects();
    super.onInit();
  }

  RequestState getSubjectsApiStatus = RequestState.begin;

  SubjectsModel subjectsModel = SubjectsModel.skeleton;

  Future<void> getSubjects() async {
    getSubjectsApiStatus = RequestState.loading;
    update();
    var response = await _subjectsRepo.getSubjects();
    if (response is DataSuccess) {
      subjectsModel = response.data!;
      getSubjectsApiStatus = subjectsModel.data!.isEmpty
          ? RequestState.empty
          : RequestState.success;
      // print('' ?? '');
      update();
    } else if (response is DataFailed) {
      AppFunctions.customToast(message: response.error!.toString());
      getSubjectsApiStatus = RequestState.error;
      update();
    }
  }
}
