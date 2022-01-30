import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:flutter/material.dart';

import 'package:finfacil_app/modules/core/status/status_payment.dart';

class HistoricItemCustom extends StatefulWidget {
  final StatusPayment statusPayment;
  final String description;
  final String typeLaunch;
  final String date;
  final String valuePaid;
  final bool isEntry;

  HistoricItemCustom({
    this.statusPayment,
    this.description,
    this.typeLaunch,
    this.date,
    this.valuePaid,
    this.isEntry = true,
  });

  @override
  _HistoricItemCustom createState() => _HistoricItemCustom();
}

class _HistoricItemCustom extends State<HistoricItemCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.THEME_2,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 10, left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            color: ColorConst.THEME_3,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusPaymentWidget(widget: widget),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DescriptionWidget(widget: widget),
                            DateWidget(widget: widget),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TypeLaunchWidget(widget: widget),
                            ValuePaidWidget(widget: widget),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HistoricItemCustom widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.date,
      style: TextStyle(
        color: ColorConst.THEME_2,
        fontSize: 14,
      ),
    );
  }
}

class TypeLaunchWidget extends StatelessWidget {
  const TypeLaunchWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HistoricItemCustom widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.typeLaunch,
      style: TextStyle(
        color: ColorConst.THEME_2,
        fontSize: 18,
      ),
    );
  }
}

class ValuePaidWidget extends StatelessWidget {
  const ValuePaidWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HistoricItemCustom widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.valuePaid,
      style: TextStyle(
        color: widget.isEntry ? Colors.green : Colors.red,
        fontSize: 20,
      ),
    );
  }
}

class StatusPaymentWidget extends StatelessWidget {
  const StatusPaymentWidget({Key key, @required this.widget}) : super(key: key);

  final HistoricItemCustom widget;

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.statusPayment.getIcon(),
      color: widget.statusPayment.getColor(),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key key, @required this.widget}) : super(key: key);

  final HistoricItemCustom widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.description,
      style: TextStyle(
        color: ColorConst.THEME_1,
        fontSize: 14,
      ),
    );
  }
}
