import 'package:nadros/core/data/data_service.dart';
import 'package:nadros/core/data/data_state.dart';
import 'package:nadros/features/auth/data/models/login_model.dart';
import 'package:nadros/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthLoginRepo {
  final DataService _apiServices;

  AuthRepoImpl(this._apiServices);

  @override
  Future<DataState<LoginInitialResponse>> initialLogin({
    required LoginInitialRequest loginInitialRequest,
  }) async {
      return await _apiServices.postData(
        fromJson: LoginInitialResponse.fromJson,
        // baseUrl: AppConstants.baseUrl,
        endPoint: 'auth/detect-tenant',
        data: loginInitialRequest.toJson(),
      );
    }

  @override
  Future<DataState<LoginResponse>> login({required LoginRequest loginRequest}) async {
    return await _apiServices.postData(
      fromJson: LoginResponse.fromJson,
      // baseUrl: AppConstants.baseUrlWithTenant,
      endPoint: "auth/login",
      data: loginRequest.toJson(),
    );
    // LoginResponse loginResponse = LoginResponse.fromJson(data);
  }
}
