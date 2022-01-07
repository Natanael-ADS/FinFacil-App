abstract class StatusAddDocument {
  String message();
}

class StatusOK implements StatusAddDocument {
  @override
  String message() => "OK";
}

class StatusError implements StatusAddDocument {
  final Exception error;
  final msg;

  StatusError({this.error, this.msg});
  @override
  String message() {
    print("StatusErro: $msg");
    return "Erro ao inserir";
  }
}
