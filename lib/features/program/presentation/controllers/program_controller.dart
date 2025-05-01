import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/app_functions.dart';
import 'package:nadros/core/utils/enums.dart';
import 'package:nadros/features/program/data/models/program_model.dart';
import 'package:nadros/features/program/data/repo/program_repo.dart';
import 'package:nadros/features/program/data/repo/program_repo_impl.dart';

class ProgramController extends GetxController{
  final ProgramRepo _programRepo = ProgramRepoImpl();

  @override
  void onInit() {
    getProgram();
    super.onInit();
  }

  final List<String> arabicDays = [
    "الأحد", "الإثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"
  ];

  final List<String> englishDays = [
    "SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"
  ];


  RequestState getProgramApiStatus = RequestState.begin;

  ProgramModel programModel = ProgramModel.skeleton;
  Map<String, List<Data>> sortedProgramByDay = {};

  Future<void> getProgram() async {
    getProgramApiStatus = RequestState.loading;
    update();
    var response = await _programRepo.getProgram();
    if (response is DataSuccess) {
      programModel = response.data!;
      sortedProgramByDay = ProgramModel.sortDays(programModel.data, englishDays);
      getProgramApiStatus = programModel.data!.isEmpty
          ? RequestState.empty
          : RequestState.success;
      update();
    } else if (response is DataFailed) {
      AppFunctions.customToast(message: response.error!.toString());
      getProgramApiStatus = RequestState.error;
      update();
    }
  }
}