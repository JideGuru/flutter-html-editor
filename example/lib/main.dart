import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html_editor/html_editor.dart';

/**
 * Created by riyadi rb on 2/5/2020.
 * link  : https://github.com/xrb21/flutter-html-editor
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo Flutter HTML Editor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                hint: "Your text here...",
                //value: "text content initial, if any",
                key: keyEditor,
                height: 400,
                getImageUrl: (image)=>sendImageUrl(image),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blueGrey,
                      onPressed: (){
                        setState(() {
                          keyEditor.currentState.setEmpty();
                        });
                      },
                      child: Text("Reset", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 16,),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        final txt = await keyEditor.currentState.getText();
                        print(txt);
                      },
                      child: Text("Submit", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(result),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<String> sendImageUrl(File image) async {
    print(image.path);
    await Future.delayed(Duration(seconds: 5));
    return "https://avatars0.githubusercontent.com/u/24323581?s=460&u=243b3e74976f8274de7237356da8dcd2d2a14244&v=4";
  }
}
