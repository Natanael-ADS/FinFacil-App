import 'package:finfacil_app/modules/login/external/datasources/UserDatabase.dart';
import 'package:finfacil_app/modules/login/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final database = UserDatabase();
  testWidgets('retorna uma UserModel admin...', (tester) async {
    final result = await database.searchLogin("admin");

    expect(result, isA<List<UserModel>>());
    expect(result.length, 1);
  });
}
