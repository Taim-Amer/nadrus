import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/features/homeworks/data/models/homeworks_model.dart';

abstract class HomeworksRepo{
  Future<DataState<HomeworksModel>> getHomeworks();
}