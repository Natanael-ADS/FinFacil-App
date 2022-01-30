import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:flutter/material.dart';

abstract class StatusPayment {
  IconData getIcon();
  Color getColor();
}

class Overdue implements StatusPayment {
  @override
  Color getColor() => ColorConst.ICON_OVERDUE;

  @override
  IconData getIcon() => Icons.circle;
}

class Paid implements StatusPayment {
  @override
  Color getColor() => ColorConst.ICON_PAID;

  @override
  IconData getIcon() => Icons.circle;
}

class Pending implements StatusPayment {
  @override
  Color getColor() => ColorConst.ICON_PENDING;

  @override
  IconData getIcon() => Icons.circle;
}
