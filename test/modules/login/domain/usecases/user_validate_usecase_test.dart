import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/domain/repositories/user_validate_repository.dart';
import 'package:finfacil_app/modules/login/domain/usecases/user_validate_usecase.dart';
import 'package:finfacil_app/modules/login/status_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_validate_usecase_test.mocks.dart';

@GenerateMocks([UserValidateRepository])
void main() {
  final repository = MockUserValidateRepository();
  final usecase = UserValidateUseCaseImpl(repository);
  testWidgets('User is Validated with Sucess! ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async {
      return [User(name: "natanael", password: "123")];
    });

    final user = User(name: "natanael", password: "123");

    final result = await usecase(user);

    expect(result, isA<SuccessLogin>());
  });

  testWidgets('User is invalidate! ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async {
      return [User(name: "natanael", password: "123")];
    });

    final user = User(name: "natanael", password: "122");

    final result = await usecase(user);

    expect(result, isA<InvalidateLogin>());
  });

  testWidgets('User is incomplete! ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async {
      return [User(name: "natanael", password: "123")];
    });

    final user = User(name: "natanael", password: "");

    final result = await usecase(user);

    expect(result, isA<IncompleteLogin>());
  });

  testWidgets('Without user to login! ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async {
      return [User(name: "natanael", password: "123")];
    });

    final user = User(name: "", password: "");

    final result = await usecase(user);

    expect(result, isA<WithoutLogin>());
  });

  testWidgets('User not found! ...', (tester) async {
    when(repository.search(any)).thenAnswer((_) async {
      return [User(name: "natanael", password: "123")];
    });

    final user = User(name: "thais", password: "123");

    final result = await usecase(user);

    expect(result, isA<NotFoundLogin>());
  });

  testWidgets('Login with Errors! ...', (tester) async {
    when(repository.search(any)).thenThrow(Exception());

    final user = User(name: "thais", password: "123");

    final result = await usecase(user);

    expect(result, isA<ErrorLogin>());
  });
}
