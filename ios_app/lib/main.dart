import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PlayGroundApp());
}

class PlayGroundApp extends StatelessWidget {
  const PlayGroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLAY-GROUND',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const PlayGroundPage(),
    );
  }
}

class PlayGroundPage extends StatefulWidget {
  const PlayGroundPage({super.key});

  @override
  State<PlayGroundPage> createState() => _PlayGroundPageState();
}

class _PlayGroundPageState extends State<PlayGroundPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            debugPrint('بدأ تحميل: $url');
          },
          onPageFinished: (url) {
            debugPrint('تم تحميل: $url');
          },
          onWebResourceError: (error) {
            debugPrint('خطأ: ${error.description}');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://tonyminanew-del.github.io/PLAY-GROUND/',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}