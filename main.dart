import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MizanApp());

class MizanApp extends StatelessWidget {
  const MizanApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mizan Academy IQ',
      theme: ThemeData(
        primaryColor: const Color(0xFF2c5282),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2c5282),
          foregroundColor: Color(0xFFd4af37),
        ),
      ),
      home: const MizanWebView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MizanWebView extends StatefulWidget {
  const MizanWebView({Key? key}) : super(key: key);
  @override
  State<MizanWebView> createState() => _MizanWebViewState();
}

class _MizanWebViewState extends State<MizanWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.mizaniq.online'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mizan Academy IQ', style: TextStyle(color: Color(0xFFd4af37), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2c5282),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
