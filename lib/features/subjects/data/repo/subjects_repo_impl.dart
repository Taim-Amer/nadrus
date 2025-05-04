import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/data/data_service.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/injector.dart';
import 'package:nadros/features/subjects/data/models/subjects_model.dart';
import 'package:nadros/features/subjects/data/repo/subjects_repo.dart';

class SubjectsRepoImpl implements SubjectsRepo{
  final DataService _dataService = injector();

  @override
  Future<DataState<SubjectsModel>> getSubjects() async{
    return await _dataService.getData(
      endPoint: DataConsts.subjects,
      fromJson: SubjectsModel.fromJson,
    );
  }
}