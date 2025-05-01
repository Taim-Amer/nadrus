import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/data/data_service.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/injector.dart';
import 'package:nadros/features/program/data/models/program_model.dart';
import 'package:nadros/features/program/data/repo/program_repo.dart';

class ProgramRepoImpl implements ProgramRepo{
  final DataService _dataService = injector();

  @override
  Future<DataState<ProgramModel>> getProgram({String? day}) async{
    return await _dataService.getData(
      endPoint: DataConsts.program,
      // queryParameters: {
      //   'day' : day
      // },
      fromJson: ProgramModel.fromJson,
    );
  }

}