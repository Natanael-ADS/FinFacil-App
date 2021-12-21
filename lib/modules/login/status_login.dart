import 'package:finfacil_app/modules/core/util/dialog_util.dart';

abstract class StatusLogin {
  showMessage(buildContext);
}

class SuccessLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showSuccess(
      buildContext,
      content: "Validated with Sucess!",
    );
  }
}

class InvalidateLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showAlert(
      buildContext,
      content: "Password incorret!",
    );
  }
}

class IncompleteLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showAlert(
      buildContext,
      content: "Please! Type name and password corretly!",
    );
  }
}

class WithoutLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showAlert(
      buildContext,
      content: "Name and password not informed!",
    );
  }
}

class NotFoundLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showInfo(
      buildContext,
      content: "User not found!",
    );
  }
}

class ErrorLogin implements StatusLogin {
  @override
  showMessage(buildContext) {
    return DialogUtil.showInfo(
      buildContext,
      content: "Error found!",
    );
  }
}
