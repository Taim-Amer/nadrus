import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/features/auth/data/models/login_model.dart';

abstract class AuthLoginRepo {
  Future<DataState<LoginInitialResponse>> initialLogin({
    required LoginInitialRequest loginInitialRequest,
  });
  Future<DataState<LoginResponse>> login(
      {required LoginRequest loginRequest});
}
