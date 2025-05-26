import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_routes.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: btn2Color),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          Card(
              color: whiteColor,
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(
                    height: height * 0.22,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 2),
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/murderbook.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(width * 0.02),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Publisher Description",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "A book is a medium for sharing stories, information, and knowledge through writing and image.",
                            style: TextStyle(fontSize: 15, color: blackColor,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "RS. 1200",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: blackColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
          ),

          SizedBox(height: height * 0.03),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _optionTile(context, "Kindle", "\$12.99","Available instantly",
                  selected: true),
              _optionTile(context, "Audiobook", "\$0.00","with membership trial"),
              _optionTile(context, "Hardcover", "\$14.09",null),
              _optionTile(context, "Paperback", "\$10.40",null),
            ],
          ),
          SizedBox(height: height * 0.025),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Other Used, New, Collectible ",
                  style: TextStyle(fontSize: 18, color: customBlue),
                ),
                TextSpan(
                  text: "from ",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),

                TextSpan(
                  text: "\$2.29",
                  style: TextStyle(fontSize: 18, color: customBlue),
                )
              ],
            ),
          ),
          SizedBox(height: height * 0.03),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Text("Buy Now", style: TextStyle(fontSize: 15)),
            ),
          ),
          SizedBox(height: height * 0.015),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(NamedRoutes.navbarpage.name,queryParameters: {
                  'index':'3',
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: btnColor,
                ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 15)),
            ),
          ),
          SizedBox(height: height * 0.025),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 15.5, color: blackColor),
              children: [
                TextSpan(
                  text: "By placing an order,",
                ),
                TextSpan(
                  text: " you're purchasing a content license",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: " & agreeing to "),
                TextSpan(
                  text: "Kindle's Store Terms of Use",
                  style: TextStyle(color: customBlue,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _optionTile(BuildContext context, String title,String price, String? subtitle,
      {bool selected = false}) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.42,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: selected ? customBlue.withOpacity(0.16) : whiteColor,
        border: Border.all(color: selected ? customBlue : lightGreyColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 13.5)),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 12.5, color: blackColor),
          ),
          subtitle != null
              ? Text(
            subtitle!,
            style: const TextStyle(fontSize: 12.5, color: blackColor),
          )
              : const SizedBox.shrink(),

        ],
      ),
    );
  }
}