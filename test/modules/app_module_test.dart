import 'package:finfacil_app/modules/app_module.dart';
import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/status_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  initModule(AppModule());
  testWidgets('return StatusLoginSuccess ...', (tester) async {
    final usecase = Modular.get<UserValidateUseCaseImpl>();

    final user = User(id: 0, logged: false, name: "admin", password: "admin");

    final result = await usecase(user);

    expect(result, isA<SuccessLogin>());
  });
}
