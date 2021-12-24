import 'package:finfacil_app/modules/core/external/database_mock.dart';
import 'package:finfacil_app/modules/login/external/datasources/UserDatabase.dart';
import 'package:finfacil_app/modules/login/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final database = DatabaseMock();
  final userDB = UserDatabase(database);
  testWidgets('retorna uma UserModel admin...', (tester) async {
    final result = await userDB.searchLogin("admin");

    expect(result, isA<List<UserModel>>());
    expect(result.length, 1);
  });
}
