import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart'; // Ensure this contains your color/style constants
import 'package:go_router/go_router.dart';

class BookDetailPage extends StatefulWidget {
  final VoidCallback? goBackToMainLibrary;
  const BookDetailPage({super.key, this.goBackToMainLibrary});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final String bookTitle = 'Harry Potter and the Sorcer...';

  final String author = 'J.K. Rowling';

  final String imagePath =
      'assets/images/murderbook.png';
 // Replace with correct image
  final double rating = 4.0;

  @override
  void initState() {
    super.initState();
    copyBundledPdfs();
  }

  Future<void> copyBundledPdfs() async {
    List<Map<String, String>> bundledPdfs = [
      {'assetPath': 'assets/pdf/1.pdf', 'fileName': '1.pdf'},
    ];

    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      Directory pdfDirectory = Directory('${appDocDir.path}/pdf');

      if (!await pdfDirectory.exists()) {
        await pdfDirectory.create(recursive: true);
      }

      for (var pdf in bundledPdfs) {
        File pdfFile = File('${pdfDirectory.path}/${pdf['fileName']}');
        if (!await pdfFile.exists()) {
          ByteData data = await rootBundle.load(pdf['assetPath']!);
          List<int> bytes = data.buffer.asUint8List();
          await pdfFile.writeAsBytes(bytes, flush: true);
        }
      }
    } catch (e) {
      debugPrint("Error copying PDFs: $e");
    }
  }

  void _openPDF(BuildContext context, String filePath, String title) async {
    try {
      GoRouter.of(context).pushNamed(
        NamedRoutes.pdfViewPage.name,
        queryParameters: {
          'pdfPath': filePath,
          'title': title,
        },
      );
    } catch (e) {
      debugPrint("Error opening PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load PDF")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: btn2Color),
          onPressed: widget.goBackToMainLibrary,
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          bookTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: blackColor,
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
        children: [
          SizedBox(height: screenHeight * 0.02),

          // Book Image
          Center(
            child: Container(
              width: screenWidth * 0.53,
              height: screenHeight * 0.32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),

          // Title and Author
          Text(
            bookTitle,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            author,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black54,
              fontSize: screenWidth * 0.035,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),

          // Rating
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating.round()
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: btnColor,
                    size: screenWidth * 0.05,
                  );
                }),
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // Tags
          Wrap(
            spacing: screenWidth * 0.02,
            children: [
              _buildTag('Fantasy', screenWidth),
              _buildTag('Drama', screenWidth),
              _buildTag('Fiction', screenWidth),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),

          // Buttons
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(NamedRoutes.audioBookPage.name);
                  },
                  icon: SvgPicture.asset(
                    'assets/svgs/play_outlined.svg',
                  ),
                  label: Text(
                    'Play Audio',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final dir = await getApplicationDocumentsDirectory();
                    final pdfPath = '${dir.path}/pdf/1.pdf';

                    _openPDF(context, pdfPath, bookTitle);
                  },

                  icon: SvgPicture.asset(
                    'assets/svgs/read_outlined.svg',
                  ),
                  label: Text(
                    'Read Book',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: screenWidth * 0.03,
                      color: btn2Color,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),

          // Summary
          Text(
            'Summary',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenWidth * 0.035,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }

  Widget _buildTag(String tag, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.007,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: blackColor.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.w700,
          color: blackColor.withOpacity(0.7),
        ),
      ),
    );
  }
}
