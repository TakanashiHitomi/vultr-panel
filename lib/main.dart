import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Vultr Panel',
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.teal,
          accentColor: Colors.amber[200],
        ),
        home: new DefaultTabController(
          length: 3,
          child: new MyHomePage(title: 'Vultr Panel Title'),
        ));
  }
}

class MyHomePage extends Scaffold {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState(title: title);
}

class _MyHomePageState extends ScaffoldState {
  int _counter = 0;
  String title;

  _MyHomePageState({this.title}) : super();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(title),
        bottom: new TabBar(tabs: <Widget>[
          new Center(
            child: new FlatButton(
              child: Text("First"),
              textColor: Colors.white,
              onPressed: () => {},
            ),
          ),
          new Center(
            child: new FlatButton(
              child: Text("Second"),
              textColor: Colors.white,
              onPressed: () => {},
            ),
          ),
          new Center(
            child: new FlatButton(
              child: Text("Third"),
              textColor: Colors.white,
              onPressed: () => {},
            ),
          ),
        ]),
      ),

      /// When the [Scaffold] is actually created in the same `build` function, the
      /// `context` argument to the `build` function can't be used to find the
      /// [Scaffold] (since it's "above" the widget being returned). In such cases,
      /// the following technique with a [Builder] can be used to provide a new
      /// scope with a [BuildContext] that is "under" the [Scaffold]:
      body: new TabBarView(
        children: <Widget>[
          new Center(
            child: Text("page 1"),
          ),
          new Center(
            child: Text("page 2"),
          ),
          new Builder(builder: (BuildContext builderContext) {
            return new Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: new Column(
                // Column is also layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug paint" (press "p" in the console where you ran
                // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
                // window in IntelliJ) to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'You have pushed the button this many times:',
                  ),
                  new Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  new RaisedButton(
                    child: Text('snack bar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                    onPressed: () =>
                        Scaffold.of(builderContext).showSnackBar(new SnackBar(
                              content:
                                  new Text('Button is pressed $_counter times'),
                              action: new SnackBarAction(
                                label: 'UNDO',
                                onPressed: () => _decrementCounter(),
                              ),
                            )),
                  ),
                ],
              ),
            );
          })
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new CustomDrawerHeader(),
              decoration: new BoxDecoration(color: Colors.blueGrey),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            ),
            new FlatButton(
              child: new Icon(Icons.thumb_up),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[new Text("Title"), new Text("data")],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
