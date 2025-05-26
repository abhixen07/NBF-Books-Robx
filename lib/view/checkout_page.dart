import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: btn2Color),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: whiteColor,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          children: [
            Text('Checkout', style: TextStyle(
              color: blackColor,
              fontSize: screenHeight*0.032,
              fontWeight: FontWeight.w800,
            )
            ),
            const SizedBox(height: 10),
            _buildTile(
              title: 'Delivery Date',
              subtitle: 'Thursday, October 12\n10:00 AM',
              onTap: () {},
            ),
            _divider(),
            _buildTile(
              title: 'Delivery Address',
              subtitle: 'Home\n43 TBZ, 456AMS, Sahiwal.....',
              onTap: () {},
            ),
            _divider(),
            _buildTile(
              title: 'Payment',
              subtitleWidget: Row(
                children: [
                  Image.asset('assets/images/cards.png', height: 20),
                  const SizedBox(width: 8),
                  const Text('Card'),
                ],
              ),
              onTap: () {},
            ),
            _divider(),

            SizedBox(height: screenHeight * 0.02),

            /// Order Summary
            const Text(
              'Order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _orderRow('Today', ''),
            _orderRow('The Murder of History x 1', 'Rs.1200'),
            _orderRow("Towards people's History in Pakistan x 1", 'Rs.1500'),
            _orderRow('Pakistan a Hard Country x 1', 'Rs.560'),
            _orderRow('Delivery Fee', 'Rs.45'),
            const Divider(thickness: 1),
            _orderRow('Total', 'Rs.3260', isBold: true),

            SizedBox(height: screenHeight * 0.025),

            /// Promo Code
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greyColor.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Code Redeemed", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: btnColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "20% Off",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 20,),

            /// Confirm Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(NamedRoutes.paymentPage.name);
                },
                child: const Text(
                  'Confirm Order',
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
    );
  }

  Widget _buildTile({
    required String title,
    String? subtitle,
    Widget? subtitleWidget,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6), // Space between title and subtitle
                  subtitleWidget ??
                      (subtitle != null
                          ? Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )
                          : const SizedBox()),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black54),
          ],
        ),
      ),
    );
  }


  Widget _divider() => const Divider(thickness: 1);

  Widget _orderRow(String label, String price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500,fontSize: 15))),
          Text(price, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
