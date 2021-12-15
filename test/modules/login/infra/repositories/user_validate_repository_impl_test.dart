import 'package:finfacil_app/modules/login/domain/entities/user.dart';
import 'package:finfacil_app/modules/login/infra/datasources/user_validate_datasource.dart';
import 'package:finfacil_app/modules/login/infra/models/user_model.dart';
import 'package:finfacil_app/modules/login/infra/repositories/user_validate_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_validate_repository_impl_test.mocks.dart';

@GenerateMocks([UserValidateDatasource])
void main() {
  final datasource = MockUserValidateDatasource();
  final repository = UserValidateRepositoryImpl(datasource);
  testWidgets('return List<UserModel>...', (tester) async {
    when(datasource.searchLogin(any)).thenAnswer(
      (realInvocation) async {
        return [UserModel()];
      },
    );
    User user = User();
    final result = await repository.search(user);

    expect(result, isA<List<User>>());
  });
}
