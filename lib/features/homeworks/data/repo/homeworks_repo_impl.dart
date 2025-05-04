import 'package:nadros/core/data/data_consts.dart';
import 'package:nadros/core/data/data_service.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/core/utils/injector.dart';
import 'package:nadros/features/homeworks/data/models/homeworks_model.dart';
import 'package:nadros/features/homeworks/data/repo/homeworks_repo.dart';

class HomeworksRepoImpl implements HomeworksRepo{
  final DataService _dataService = injector();

  @override
  Future<DataState<HomeworksModel>> getHomeworks(String? date) async{
    return await _dataService.getData(
      endPoint: DataConsts.assignments,
      queryParameters: {
        'date' : date
      },
      fromJson: HomeworksModel.fromJson,
    );
  }


}