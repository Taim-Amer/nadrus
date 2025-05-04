import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/features/subjects/data/models/subjects_model.dart';

abstract class SubjectsRepo{
  Future<DataState<SubjectsModel>> getSubjects();
}