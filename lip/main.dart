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
          elevation: 2,
        ),
        useMaterial3: true,
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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.mizaniq.online'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mizan Academy IQ',
          style: TextStyle(
            color: Color(0xFFd4af37),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2c5282),
        elevation: 2,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading)
            Container(
              color: const Color(0xFF1a1a2e).withOpacity(0.7),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFd4af37)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
