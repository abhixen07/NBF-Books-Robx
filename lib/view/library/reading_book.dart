import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure to add flutter_svg to pubspec.yaml


class ReadingBookPage extends StatelessWidget {
  final VoidCallback? goBackToMainLibrary;
  const ReadingBookPage({super.key,this.goBackToMainLibrary});

  final String bookTitle = 'The Black Witch';
  final String author = 'Laurie Forest';
  final String bookImage = 'assets/images/black_witch.png';


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: goBackToMainLibrary,
            icon: const Icon(Icons.arrow_back_ios_outlined,color: btn2Color,)),
            backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.015),
            Text(
              'Reading',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Book Image
                        Container(
                          width: screenWidth * 0.18,
                          height: screenHeight * 0.11,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(bookImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),

                        // Title, Author, Button
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookTitle,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                author,
                                style: TextStyle(
                                  color: customBlue,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              TextButton.icon(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                    vertical: screenHeight * 0.005,
                                  ),
                                  backgroundColor: btn2Color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: const Size(0, 0),
                                ),
                                icon: SvgPicture.asset(
                                  'assets/svgs/play.svg',
                                ),
                                label: Padding(
                                  padding: const EdgeInsets.all(2.5),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: screenWidth * 0.025,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Heart icon
                        Icon(
                          Icons.favorite,
                          color: greyColor.shade400,
                          size: screenWidth * 0.055,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
