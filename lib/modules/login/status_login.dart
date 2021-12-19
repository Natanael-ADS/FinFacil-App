abstract class StatusLogin {
  String showMessage();
}

class SuccessLogin implements StatusLogin {
  @override
  String showMessage() => "Validated with Sucess!";
}

class InvalidateLogin implements StatusLogin {
  @override
  String showMessage() => "Password incorret!";
}

class IncompleteLogin implements StatusLogin {
  @override
  String showMessage() => "Please! Type name and password corretly!";
}

class WithoutLogin implements StatusLogin {
  @override
  String showMessage() => "Name and password not informed!";
}

class NotFoundLogin implements StatusLogin {
  @override
  String showMessage() => "User not found!";
}

class ErrorLogin implements StatusLogin {
  @override
  String showMessage() => "Error found!";
}
