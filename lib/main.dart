import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Site {
  Site({required this.name, required this.url, required this.icon});

  final String name;
  final String url;
  final Icon icon;
}

var sites = [
  Site(
      name: "Календарь",
      url: "https://timmson.github.io/prod-cal-ui/",
      icon: const Icon(Icons.calendar_month)),
  Site(
      name: "Кредит",
      url: "https://timmson.github.io/loan-schedule-ui/",
      icon: const Icon(Icons.money)),
  Site(
      name: "Инвестиции",
      url: "https://timmson.github.io/prod-cal-ui/",
      icon: const Icon(Icons.arrow_upward))
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnConsoleMessage((message) => {})
      ..loadRequest(Uri.parse(sites[0].url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: WebViewWidget(controller: _controller),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...sites.map((site) =>
              BottomNavigationBarItem(label: site.name, icon: site.icon))
        ],
        onTap: (index) => _controller.loadRequest(Uri.parse(sites[index].url)),
      ),
    );
  }
}
