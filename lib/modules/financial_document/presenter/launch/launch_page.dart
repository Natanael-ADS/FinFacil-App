import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:finfacil_app/modules/core/const/route_const.dart';
import 'package:finfacil_app/modules/core/custom/filter_custom.dart';
import 'package:finfacil_app/modules/core/custom/textfield_custom.dart';
import 'package:finfacil_app/modules/financial_document/presenter/launch/launch_store.dart';

class LaunchPage extends StatefulWidget {
  String type;
  LaunchPage(this.type);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  LaunchStore store = LaunchStore();

  @override
  Widget build(BuildContext context) {
    store.setTypeLaunch(widget.type);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lançamento"),
        leading: IconButton(
            onPressed: () => Modular.to.navigate(RouteConst.HOME),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          TextButton(
            onPressed: () => store.saveDocument(context),
            child: Text(
              "SALVAR",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _typeLaunchPage(),
          _category(),
          _totalValue(),
          _totalPeding(),
          _totalPaid(),
          _description(),
          _dueDate(),
          _parcelValue(),
          _numberParcel(),
          _numberParcelPaid(),
        ],
      ),
    );
  }

  _typeLaunchPage() {
    return Observer(builder: (_) {
      return CustomFilter(
        contentText: store.showLaunch,
        onPressedNext: () => store.setTypeLaunch(store.showLaunch),
        onPressedPrevious: () => store.setTypeLaunch(store.showLaunch),
      );
    });
  }

  _category() {
    return CustomFilter(
      contentText: "BOLETO",
    );
  }

  _totalValue() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "VALOR TOTAL:",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Observer(builder: (_) {
            return Text(
              store.totalValue,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    );
  }

  _totalPeding() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "TOTAL PENDENTE:",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Observer(builder: (_) {
            return Text(
              store.totalPending,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    );
  }

  _totalPaid() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "TOTAL PAGO:",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Observer(builder: (_) {
            return Text(
              store.totalPaid,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    );
  }

  _description() {
    return CustomTextField(
      labelText: "DESCRIÇÃO",
      controller: store.descriptionController,
    );
  }

  _dueDate() {
    return CustomTextField(
      labelText: "DIA DO VENCIMENTO",
      controller: store.dueDateController,
      keyboardType: TextInputType.datetime,
    );
  }

  _parcelValue() {
    return CustomTextField(
      labelText: "VALOR DA PARCELA",
      controller: store.parcelValueController,
      keyboardType: TextInputType.number,
      onChanged: (_) => store.calculeTotal(),
    );
  }

  _numberParcel() {
    return CustomTextField(
      labelText: "QUANTIDADE DE PARCELA",
      controller: store.numberParcelController,
      keyboardType: TextInputType.number,
      onChanged: (_) => store.calculeTotal(),
    );
  }

  _numberParcelPaid() {
    return CustomTextField(
      labelText: "QUANTIDADE DE PARCELA PAGA",
      controller: store.numberParcelPaidController,
      keyboardType: TextInputType.number,
      onChanged: (_) => store.calculeTotal(),
    );
  }
}
