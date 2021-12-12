import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/domain/repositories/user_validate_repository.dart';

import '../../status_login.dart';

abstract class UserValidateUsecase {
  Future<StatusLogin> call(User user);
}

class UserValidateUseCaseImpl implements UserValidateUsecase {
  final UserValidateRepository repository;

  UserValidateUseCaseImpl(this.repository);

  @override
  Future<StatusLogin> call(User user) async {
    try {
      if (user.getName().isEmpty && user.getPassword().isEmpty) {
        return WithoutLogin();
      }

      if (user.getName().isEmpty || user.getPassword().isEmpty) {
        return IncompleteLogin();
      }

      final users = await repository.search(user);
      return _checkingUsers(users, user);
    } catch (e) {
      return ErrorLogin();
    }
  }

  StatusLogin _checkingUsers(List<User> users, User user) {
    for (User local in users) {
      if (local.getName() == user.getName()) {
        if (local.getPassword() == user.getPassword()) {
          return SuccessLogin();
        } else {
          return InvalidateLogin();
        }
      }
    }

    return NotFoundLogin();
  }
}
