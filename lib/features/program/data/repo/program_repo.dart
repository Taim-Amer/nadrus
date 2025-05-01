import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/features/program/data/models/program_model.dart';

abstract class ProgramRepo{

  Future<DataState<ProgramModel>> getProgram({String? day});
}