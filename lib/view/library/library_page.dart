import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class LibraryPage extends StatelessWidget {
  final Function(int index)? onSubPageChange;
  LibraryPage({super.key,this.onSubPageChange});


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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text('Library', style: TextStyle(fontWeight: FontWeight.w700, color: blackColor)),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: ListView(
          children: [
            sectionHeader('Recent (Last 1 Month)', () {
              onSubPageChange!(1);
            }),
            const SizedBox(height: 10),
            horizontalBookList(screenWidth, screenHeight, context),
            const SizedBox(height: 20),
            _buildLibraryCard(Icons.library_books, 'My Library', '2 Books', (){
              onSubPageChange!(1);
            }),
            const SizedBox(height: 10),
            _buildLibraryCard(Icons.favorite, 'Favorite', '2 Books', (){
              onSubPageChange!(2);
            }),
            const SizedBox(height: 10),
            _buildLibraryCard(Icons.menu_book, 'Reading (In Progress)', '2 Books', (){
              onSubPageChange!(3);
            }),
            const SizedBox(height: 20),
            sectionHeader('Playlist', () {}),
            const SizedBox(height: 10),
            horizontalBookList(screenWidth, screenHeight, context),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String title,VoidCallback onTap) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          InkWell(onTap: onTap,child: const Text("See all", style: TextStyle(color: btnColor, fontWeight: FontWeight.bold))),
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

  Widget _buildLibraryCard(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: customGreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: btnColor,
              child: Icon(icon, color: whiteColor),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(subtitle,
                    style: const TextStyle(color: blackColor, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
