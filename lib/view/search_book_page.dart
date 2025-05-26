import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/style/style.dart';

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({super.key});

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  final List<String> categories = [
    "Free Summaries",
    "Business",
    "New Premium Suit",
    "Business",
  ];

  List<Map<String, String>> books = [
    {
      "title": "The Kite Runner",
      "price": "\$14.99",
      "image": "assets/images/book1.png",
      "pdfPath": "assets/pdfs/1.pdf",
    },
    {
      "title": "The Subtle Art of Not Giving a F*ck",
      "price": "\$20.99",
      "image": "assets/images/book2.png",
      "pdfPath": "assets/pdf/2.pdf",
    },
    {
      "title": "The Art of War",
      "price": "\$14.99",
      "image": "assets/images/book1.png",
      "pdfPath": "assets/pdf/3.pdf",
    },
  ];

  @override
  void initState() {
    super.initState();
    copyBundledPdfs();
  }

  Future<void> copyBundledPdfs() async {
    List<Map<String, String>> bundledPdfs = [
      {'assetPath': 'assets/pdf/1.pdf', 'fileName': '1.pdf'},
      {'assetPath': 'assets/pdf/2.pdf', 'fileName': '2.pdf'},
      {'assetPath': 'assets/pdf/3.pdf', 'fileName': '3.pdf'},
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
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Books', style: TextStyle(fontWeight: FontWeight.w700, color: blackColor)),
        centerTitle: false,
        backgroundColor: whiteColor,
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        children: [
          SizedBox(height: screenHeight * 0.01),

          // Search Bar
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: btn2Color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                    child: SvgPicture.asset('assets/svgs/search.svg'),
                  ),
                  hintText: "Search for books or Authors",
                  hintStyle: const TextStyle(color: blackColor, fontWeight: FontWeight.w600),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 7,
                  children: categories.map((category) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                        color: btnColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(category, style: const TextStyle(fontWeight: FontWeight.bold, color: whiteColor, fontSize: 12)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          sectionHeader("Top Ranking"),
          const SizedBox(height: 10),
          horizontalBookList(screenWidth, screenHeight, context),

          const SizedBox(height: 10),
          sectionHeader("Books"),
          const SizedBox(height: 10),
          horizontalBookList(screenWidth*1.4, screenHeight*1.4, context),
        ],
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        const Text("See all", style: TextStyle(color: btnColor, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget horizontalBookList(double screenWidth, double screenHeight, BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final book = books[index];

          return GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(NamedRoutes.productDetailsPage.name);
              //_openPDF(context, book['pdfPath']!, book['title']!);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SizedBox(
                width: screenWidth * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(book['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book['title']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book['price']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
