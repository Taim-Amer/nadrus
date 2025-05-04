class LoginInitialRequest {
  final String username;
  final String provider;

  LoginInitialRequest({
    required this.username,
    required this.provider,
  });

  factory LoginInitialRequest.fromJson(Map<String, dynamic> json) {
    return LoginInitialRequest(
      username: json['username'] as String,
      provider: json['provider'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'provider': provider,
    };
  }
}

class LoginInitialResponse {
  final String message;
  final InitialLogineData initialLogineData;

  LoginInitialResponse(this.message, this.initialLogineData);

  factory LoginInitialResponse.fromJson(Map<String, dynamic> json) {
    return LoginInitialResponse(
      json['message'] as String,
      InitialLogineData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class InitialLogineData {
  final int id;
  final String provider;
  final String username;
  final String tenantId;

  InitialLogineData({
    required this.id,
    required this.provider,
    required this.username,
    required this.tenantId,
  });

  factory InitialLogineData.fromJson(Map<String, dynamic> json) {
    return InitialLogineData(
      id: json['id'],
      provider: json['provider'],
      tenantId: json['tenant_id'],
      username: json['username'],
    );
  }
}

// ///////////////////////////////////////////////////////////////////////////////////

class LoginRequest {
  final String username;
  final String password;
  final String provider;

  LoginRequest(
      {required this.username, required this.password, required this.provider});
  Map<String, dynamic> toJson() {
    return {'username': username, 'provider': provider, 'password': password};
  }
}







class LoginResponse {
  final String message;
  final LoginResponseData data;

  LoginResponse({
    required this.message,
    required this.data,
  });

  // دالة لإنشاء كائن من JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      data: LoginResponseData.fromJson(json['data']), // تحويل البيانات إلى كائن
    );
  }

  // دالة لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(), // تحويل البيانات إلى JSON
    };
  }
}


class LoginResponseData {
  final String accessToken;
  final User user;

  LoginResponseData({
    required this.accessToken,
    required this.user,
  });

  // دالة لإنشاء كائن من JSON
  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']), // تحويل بيانات المستخدم إلى كائن
    );
  }

  // دالة لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'user': user.toJson(), // تحويل بيانات المستخدم إلى JSON
    };
  }
}


class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String? deviceModel; // يمكن أن تكون قيمة فارغة (null)
  final int gender;
  final String phone;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.deviceModel,
    required this.gender,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  // دالة لإنشاء كائن من JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      deviceModel: json['device_model'],
      gender: json['gender'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  // دالة لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'device_model': deviceModel,
      'gender': gender,
      'phone': phone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}







