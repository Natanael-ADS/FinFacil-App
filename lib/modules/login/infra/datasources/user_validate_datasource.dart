import 'package:finfacil_app/modules/login/infra/models/user_model.dart';

abstract class UserValidateDatasource {
  Future<List<UserModel>> searchLogin(String name);
}
