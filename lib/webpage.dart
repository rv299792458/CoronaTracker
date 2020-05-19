import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class LoadWebPage extends StatefulWidget {
  @override
  _LoadWebPageState createState() => _LoadWebPageState();
}

class _LoadWebPageState extends State<LoadWebPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("Web"),
      ),
     // url: "https://firstsiteguide.com/examples-of-blogs/",
      url: "https://www.mohfw.gov.in/index.php",
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("Web"),
      ),
      // url: "https://firstsiteguide.com/examples-of-blogs/",
      url: "https://news.google.com/topics/CAAqBwgKMMqAmAsw9KmvAw?hl=en-IN&gl=IN&ceid=IN%3Aen",
    );
  }
}


