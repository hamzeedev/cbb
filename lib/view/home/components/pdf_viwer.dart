import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDFViewerView extends StatelessWidget {
  const PDFViewerView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.network(url,canShowPageLoadingIndicator: true),
      ),
    );
  }
}