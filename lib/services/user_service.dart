import 'package:jobberz_app/models/login_model.dart';
import 'package:jobberz_app/models/register_model.dart';
import 'package:jobberz_app/models/user_model.dart';
import 'package:jobberz_app/services/base_service.dart';

class UserService extends BaseService {
  Future<RegisterModel?> userRegister(Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'username': data['username'],
        'email': data['email'],
        'password': data['password'],
      };

      final response = await post('/register', dataRegister);

      if (response.statusCode == 200) {
        print(response.body);
        return RegisterModel.fromJson(response.body['Data']);
      } else {
        throw (response.body['Data'] ?? response.body['Message']);
      }
    } catch (e) {
      print(e.toString());
      // throw (e.toString());
    }
  }

  Future<LoginModel?> userLogin(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
      };

      final response = await post('/login', dataLogin);
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.body);
      } else {
        throw (response.body['Data'] ?? response.body['Message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> userLogout(Map<String, dynamic> data) async {
    try {
      var payload = <String, dynamic>{
        'id': data['id'],
      };

      final response = await post('/logout', payload);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> userProfile() async {
    try {
      final response = await get('/user');

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
