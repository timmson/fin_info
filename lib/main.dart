import 'package:fin_info/theme.dart';
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
      name: "Накопить 🍋",
      url: "https://t.me/s/makealemon",
      icon: const Icon(Icons.info)),
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
      url: "https://timmson.github.io/fire-calculator/",
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
      title: 'Fin Info',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const MyHomePage(title: 'Fin Info'),
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

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnConsoleMessage((message) => {})
      ..loadRequest(Uri.parse(sites[_selectedIndex].url));
  }

  _onBottomTap(index) {
    setState(() {
      _selectedIndex = index;
      _controller.loadRequest(Uri.parse(sites[index].url));
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 10,
          backgroundColor: themeData.colorScheme.inversePrimary),
      body: WebViewWidget(controller: _controller),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,
        items: [
          ...sites.map((site) =>
              BottomNavigationBarItem(label: site.name, icon: site.icon))
        ],
        onTap: _onBottomTap,
      ),
    );
  }
}
