import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfPath;
  final String title;
  const PdfViewScreen({super.key, required this.pdfPath, required this.title});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  int totalPages = 0;
  int currentPages = 0;
  int? initialPage;
  PDFViewController? _pdfViewController;
  final NoScreenshot _noScreenShot = NoScreenshot.instance;

  @override
  void initState() {
    super.initState();
    _noScreenShot.screenshotOff();
    _loadLastPage();
  }

  Future<void> _loadLastPage() async {
    final prefs = await SharedPreferences.getInstance();
    final lastPage = prefs.getInt(widget.pdfPath) ?? 0;
    setState(() {
      initialPage = lastPage;
    });
  }

  Future<void> _saveLastPage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget.pdfPath, page);
  }

  @override
  void dispose() {
    _noScreenShot.screenshotOn();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title, // 👈 Use dynamic title
          style: const TextStyle(
            color: blackColor,
            fontFamily: 'PoltawskiNowy',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [

            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset(
                'assets/svgs/notification.svg',
                height: 24,
                width: 24,
              ),
            ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: initialPage == null
                ? const Center(child: CircularProgressIndicator())
                : PDFView(
              filePath: widget.pdfPath,
              pageFling: false,
              autoSpacing: false,
              defaultPage: initialPage!,
              onRender: (pages) {
                setState(() {
                  totalPages = pages!;
                });
              },
              onViewCreated: (controller) {
                _pdfViewController = controller;
              },
              onPageChanged: (page, total) {
                setState(() {
                  currentPages = page!;
                });
                _saveLastPage(page!);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: whiteColor,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_new, size: 18,color: btn2Color,),
                const SizedBox(width: 8),
                const Text("Chapter #01", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: totalPages > 0 ? currentPages / totalPages : 0,
                    backgroundColor: greyColor,
                    color: btn2Color,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${currentPages + 1}/$totalPages',
                  style: const TextStyle(color: btn2Color, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios, size: 18,color: btn2Color,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
