import 'package:finfacil_app/modules/financial_document/infra/models/entry_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/exit_history_model.dart';
import 'package:finfacil_app/modules/financial_document/infra/models/financial_document_model.dart';
import 'package:finfacil_app/modules/login/infra/models/user_model.dart';

class DatabaseMock {
  List<UserModel> _userModels;
  List<FinancialDocumentModel> _finDocumentModels;

  DatabaseMock() {
    _userModels = _initUserModels();
    _finDocumentModels = _initFinancialDocumentModels();
  }

  List<UserModel> getUsers() => _userModels;
  void setUser(UserModel model) => _userModels.add(model);

  List<FinancialDocumentModel> getFinancialDocuments() => _finDocumentModels;
  void setFinancialDocument(FinancialDocumentModel model) =>
      _finDocumentModels.add(model);

  List<UserModel> _initUserModels() {
    return [
      UserModel(id: 1, name: "admin", password: "admin", logged: false),
    ];
  }

  List<FinancialDocumentModel> _initFinancialDocumentModels() {
    return [
      FinancialDocumentModel(
        valueParcel: 100,
        entries: [
          EntryHistoryModel(day: DateTime(2021, 12, 25)),
          EntryHistoryModel(day: DateTime(2021, 12, 01))
        ],
        exits: [
          ExitHistoryModel(day: DateTime(2021, 12, 26)),
        ],
      ),
      FinancialDocumentModel(
        valueParcel: 50,
        exits: [
          ExitHistoryModel(day: DateTime(2021, 12, 26)),
        ],
      ),
      FinancialDocumentModel(
        valueParcel: 200,
        exits: [
          ExitHistoryModel(day: DateTime(2021, 11, 26)),
        ],
      )
    ];
  }
}
