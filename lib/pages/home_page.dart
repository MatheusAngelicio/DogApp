import 'package:dogapp/drawer_list.dart';
import 'package:dogapp/pages/hello_listview.dart';
import 'package:dogapp/pages/hello_page2.dart';
import 'package:dogapp/pages/hello_page3.dart';
import 'package:dogapp/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Hello Flutter"),
            bottom: TabBar(tabs: [
              Tab(text: "TAB 1",),
              Tab(text: "TAB 2",),
              Tab(text: "TAB 3",),
            ]),
          ),
          body: TabBarView(children: [
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            )
          ],),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _onClickTab();
                },
              ),
              const SizedBox(
                width: 8,
              ),
              FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {
                  _onClickTab();
                },
              ),
            ],
          ),
        drawer: DrawerList()
      ),
    );
  }

  _body(context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_text(), _pageView(), _buttons()],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _onClickNavigator(context, HelloListView());
                    },
                    child: Text("ListView")),
                ElevatedButton(
                    onPressed: () {
                      _onClickNavigator(context, HelloPage2());
                    },
                    child: Text("Page 2")),
                ElevatedButton(
                    onPressed: () {
                      _onClickNavigator(context, HelloPage3());
                    },
                    child: Text("Page 3")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _onClickSnack(context);
                    },
                    child: Text("Snack")),
                ElevatedButton(
                    onPressed: () {
                      _onClickDialog(context);
                    },
                    child: Text("Dialog")),
                ElevatedButton(
                    onPressed: () {
                      _onClickToast();
                    },
                    child: Text("Toast")),
              ],
            )
          ],
        );
      },
    );
  }

  _onClickNavigator(BuildContext context, Widget page) {
    push(context, page);
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Ola flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("Ok");
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter ?? muito legal"),
            actions: <Widget>[
              TextButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  print("OK !!!");
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter ?? muito legal",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _onClickTab() {
    print("Adicionar");
  }
}
