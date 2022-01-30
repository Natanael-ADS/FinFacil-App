import 'package:finfacil_app/modules/core/const/color_const.dart';
import 'package:finfacil_app/modules/core/const/image_const.dart';
import 'package:finfacil_app/modules/core/const/route_const.dart';
import 'package:finfacil_app/modules/core/const/string_const.dart';
import 'package:finfacil_app/modules/core/custom/filter_custom.dart';
import 'package:finfacil_app/modules/core/custom/historic_item_custom.dart';
import 'package:finfacil_app/modules/financial_document/presenter/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: ColorConst.THEME_3,
            size: 30,
          ),
        ),
        title: Text(
          "FinFácil",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: ColorConst.THEME_3,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        child: Observer(builder: (_) {
          final rows = [
            CustomFilter(
              contentText: store.showDate(context),
              onPressedNext: () => store.nextDate(),
              onPressedPrevious: () => store.previousDate(),
              height: 80,
            ),
            EntryAndExitWidget(store: store),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Diferença",
                  style: TextStyle(fontSize: 24, color: ColorConst.TEXT_1),
                ),
              ),
            ),
            DiffrentAndButtonsWidget(store: store),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Histórico",
                  style: TextStyle(fontSize: 24, color: ColorConst.TEXT_1),
                ),
              ),
            ),
          ];
          store.rows = rows + store.getHistorics();
          return ListView.builder(
            itemCount: store.rows.length,
            itemBuilder: (_, index) {
              final item = store.rows[index];

              if (item is HistoricItemCustom) {
                return Dismissible(
                  background: Container(color: Colors.red),
                  key: Key(item.date),
                  onDismissed: (_) {
                    return store.removeHistoric(index);
                  },
                  child: item,
                );
              }
              return item;
            },
          );
        }),
      ),
    );
  }
}

class DiffrentAndButtonsWidget extends StatelessWidget {
  const DiffrentAndButtonsWidget({
    Key key,
    @required this.store,
  }) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 180,
            alignment: Alignment.bottomCenter,
            child: IconButton(
              alignment: Alignment.center,
              color: ColorConst.THEME_1,
              iconSize: 60,
              icon: Icon(Icons.add_circle_rounded),
              onPressed: () => Modular.to.navigate(
                RouteConst.LAUNCH + "/${StringConst.ENTRY}",
              ),
            ),
          ),
          Stack(children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset(ImageConst.HOME_2),
            ),
            SizedBox(height: 10),
            Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Observer(builder: (_) {
                    return Text(
                      store.status.getValueDifferent(),
                      style: TextStyle(fontSize: 16, color: ColorConst.TEXT_1),
                    );
                  }),
                ))
          ]),
          Container(
            height: 180,
            alignment: Alignment.bottomCenter,
            child: IconButton(
              alignment: Alignment.center,
              color: ColorConst.THEME_1,
              iconSize: 60,
              icon: Icon(Icons.remove_circle_rounded),
              onPressed: () => Modular.to.navigate(
                RouteConst.LAUNCH + "/${StringConst.EXIT}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EntryAndExitWidget extends StatelessWidget {
  const EntryAndExitWidget({
    Key key,
    @required this.store,
  }) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "SAÍDA",
                    style: TextStyle(
                      color: ColorConst.TEXT_2,
                      fontSize: 18,
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
                      Text(
                        store.status.getValueInput(),
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                      Text(
                        store.status.getValueOutput(),
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
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
          ),
        ),
      ),
    ]);
  }
}
