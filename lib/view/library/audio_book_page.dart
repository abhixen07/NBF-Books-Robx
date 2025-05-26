import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/style/style.dart';

class AudioBookPage extends StatelessWidget {
  const AudioBookPage({super.key});

  final String bookTitle = 'Harry Potter and the Prison...';
  final String author = 'J.K. Rowling';
  final String imagePath = 'assets/images/murderbook.png';


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: btn2Color),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          bookTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(                      fontFamily: 'Poppins',
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07,vertical: screenWidth * 0.04),
        children: [
          // Book Image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
            child: Container(
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 9,
                    color: blackColor.withOpacity(0.4),
                    spreadRadius: 2,
                    offset: Offset(0, 6)
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),

          // Title & Author
          Text(
            bookTitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(                      fontFamily: 'Poppins',
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            author,
            style: TextStyle(                      fontFamily: 'Poppins',
              fontSize: screenWidth * 0.035,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: screenHeight * 0.025),

          // Slider
          Slider(
            value: 12,
            onChanged: (value) {},
            min: 0,
            max: 47.32,
            activeColor: btn2Color,
            inactiveColor: greyColor.shade300,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("12:15", style: TextStyle(                      fontFamily: 'Poppins',fontSize: screenWidth * 0.03)),
                Text("47:32", style: TextStyle(                      fontFamily: 'Poppins',fontSize: screenWidth * 0.03)),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Player Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.volume_up_outlined, size: screenWidth * 0.07, color: iconBlueColor),
              Icon(Icons.skip_previous_outlined, size: screenWidth * 0.08, color: iconBlueColor),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: btn2Color,
                ),
                child: Icon(Icons.play_arrow_rounded, size: screenWidth * 0.08, color: whiteColor),
              ),
              Icon(Icons.skip_next_rounded, size: screenWidth * 0.08, color: iconBlueColor),
              SvgPicture.asset('assets/svgs/upload.svg'),
            ],
          ),
          SizedBox(height: screenHeight * 0.04),

          // Bottom Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomButton('Bookmark', 'assets/svgs/bookmark.svg', screenWidth),
              _bottomButton('Chapter 2', 'assets/svgs/chapter.svg', screenWidth),
              _bottomButton('Speed 10x', 'assets/svgs/speed.svg', screenWidth),
              _bottomButton('Download', 'assets/svgs/download.svg', screenWidth),
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomButton(String label, String iconPath, double screenWidth) {
    return Column(
      children: [
        SvgPicture.asset(
          iconPath,
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenWidth * 0.028,
            color: iconBlueColor,
          ),
        ),
      ],
    );
  }
}
