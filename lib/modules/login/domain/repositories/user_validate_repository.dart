import 'package:finfacil_app/modules/login/domain/entities/user.dart';

abstract class UserValidateRepository {
  Future<List<User>> search(User user) {}
}
