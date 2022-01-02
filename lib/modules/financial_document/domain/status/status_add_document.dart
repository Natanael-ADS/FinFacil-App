abstract class StatusAddDocument {
  String message();
}

class StatusOK implements StatusAddDocument {
  @override
  String message() => "OK";
}

class StatusError implements StatusAddDocument {
  final Exception error;

  StatusError(this.error);
  @override
  String message() => "Erro ao inserir";
}
