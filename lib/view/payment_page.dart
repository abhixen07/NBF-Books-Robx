import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool saveCreditInfo = true;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Text('Add New', style: TextStyle(color: Colors.orange)),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        children: [
          Text('Payment', style: TextStyle(
            color: blackColor,
            fontSize: screenHeight*0.032,
            fontWeight: FontWeight.w800,
          )
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _pill('Visa', isActive: true),
              const SizedBox(width: 8),
              _pill('Mastercard'),
            ],
          ),
          const SizedBox(height: 16),

          // Card Preview (SVG-based)
          Container(
            width: double.infinity,
            height: screenHeight * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SvgPicture.asset(
                'assets/svgs/card.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 24),

          _labelValueRow('Card Number', '8364 9375 0930 7302'),
          const Divider(thickness: 0.7,),
          _labelValueRow('Card Holder', 'Minahil Farooq'),
          const Divider(thickness: 0.7,),
          Row(
            children: [
              Expanded(child: _labelValueRow('Expires', '22 / 20')),
              const SizedBox(width: 16),
              Expanded(child: _labelValueRow('CVC', '847')),
            ],
          ),
          const Divider(thickness: 0.7,),

          // Save Credit Info Checkbox
          Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: saveCreditInfo,
                activeColor: btn2Color,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (val) => setState(() => saveCreditInfo = val ?? false),
              ),
              const Text("Save credit information", style: TextStyle(fontSize: 15,color: Colors.black54)),
            ],
          ),

          const SizedBox(height: 70),

          // Done Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(NamedRoutes.paymentSuccessPage.name);
              },
              child: const Text(
                "Done",
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
        ],
      ),
    );
  }

  Widget _pill(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive ? btn2Color : greyColor.shade200,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? whiteColor : Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _labelValueRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
              color: blackColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
