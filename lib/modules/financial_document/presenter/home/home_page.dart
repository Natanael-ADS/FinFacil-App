import 'dart:ui';

import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:finfacil_app/modules/core/const/image_const.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("FinFácil"),
    );
  }

  _body(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          _date(context),
          _entryAndExit(),
          _diffrent_1(),
          _diffrent_2(),
          _buttons(),
        ],
      ),
    );
  }

  _date(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 40,
              onPressed: () => store.previousDate(context),
              icon: Image.asset(
                ImageConst.PREVIOUS,
                color: ColorConst.THEME_1,
              )),
          Observer(builder: (_) {
            return SizedBox(
              height: 20,
              width: 150,
              child: Center(
                child: Text(
                  store.showDate(),
                  style: TextStyle(fontSize: 20, color: ColorConst.TEXT_1),
                ),
              ),
            );
          }),
          IconButton(
            iconSize: 40,
            onPressed: () => store.nextDate(context),
            icon: Image.asset(
              ImageConst.NEXT,
              color: ColorConst.THEME_1,
            ),
          ),
        ],
      ),
    );
  }

  _entryAndExit() {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        height: 170,
        width: double.infinity,
        color: ColorConst.THEME_2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 40, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ENTRADA",
                    style: TextStyle(
                      color: ColorConst.TEXT_2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "SAÍDA",
                    style: TextStyle(
                      color: ColorConst.TEXT_2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Observer(builder: (_) {
                        return Text(store.status.getValueInput(),
                            style:
                                TextStyle(color: Colors.green, fontSize: 20));
                      }),
                      Observer(builder: (_) {
                        return Text(
                          store.status.getValueOutput(),
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        );
                      })
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: ColorConst.THEME_3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
            height: 180,
            width: 180,
            child: Image.asset(
              ImageConst.HOME_1,
              color: ColorConst.THEME_1,
            )),
      ),
    ]);
  }

  _diffrent_1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Diferença",
        style: TextStyle(fontSize: 30, color: ColorConst.TEXT_1),
      ),
    );
  }

  _diffrent_2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
            width: 180,
            height: 180,
            child: Image.asset(ImageConst.HOME_2),
          ),
          Container(
              width: 180,
              height: 180,
              child: Center(
                child: Observer(builder: (_) {
                  return Text(
                    store.status.getValueDifferent(),
                    style: TextStyle(fontSize: 20, color: ColorConst.TEXT_1),
                  );
                }),
              ))
        ])
      ],
    );
  }

  _buttons() {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: 35,
                    color: Colors.white,
                  ),
                  Text(
                    " Entrada",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    size: 35,
                    color: Colors.white,
                  ),
                  Text(
                    " Saída",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
