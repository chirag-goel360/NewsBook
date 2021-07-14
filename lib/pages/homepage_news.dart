import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BriefInformation extends StatefulWidget {
  final String postUrl;

  BriefInformation({
    @required this.postUrl,
  });

  @override
  _BriefInformationState createState() => _BriefInformationState();
}

class _BriefInformationState extends State<BriefInformation> {
  Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.blueGrey,
                  letterSpacing: 0.5,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Book',
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 0.5,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: WebView(
          initialUrl: widget.postUrl,
          onWebViewCreated: (WebViewController webViewController) {
            controller.complete(
              webViewController,
            );
          },
        ),
      ),
    );
  }
}
