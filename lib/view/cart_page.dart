import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/routes/app_routes.dart';
import 'package:nbf_bookpublications_app/style/style.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.close,color: btn2Color,)
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                'Edit',
                style: TextStyle(color: redColor,fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        children: [
          Text(
            'Shopping Cart',
            style: TextStyle(
              color: blackColor,
              fontSize: screenHeight*0.032,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20,),
          _buildCartItem(
            context,
            imagePath: 'assets/images/book1.png',
            author: 'K.K Aziz',
            title: 'The Murder of History',
            price: 1200,
            quantity: 1,
          ),
          const Divider(),
          _buildCartItem(
            context,
            imagePath: 'assets/images/murderbook.png',
            author: 'Asad Ali',
            title: "Towards People's History in Pakistan",
            price: 1500,
            quantity: 1,
          ),
          const Divider(),
          _buildCartItem(
            context,
            imagePath: 'assets/images/book2.png',
            author: 'Author Name',
            title: 'Pakistan a hard Country',
            price: 560,
            quantity: 1,
          ),
          const Divider(),
          const SizedBox(height: 16),

          // Coupon Code
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex:4,
                  child: const Text(
                    'Coupon code',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Your code',
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Pickup and Delivery
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isDelivery = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: greyColor), // Outline border
                    ),
                    padding: const EdgeInsets.all(8), // Optional: adjust as needed
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Pickup',style: TextStyle(color: Colors.black54),),
                      Icon(
                        isDelivery ? Icons.radio_button_off : Icons.check_circle,
                        color: isDelivery ? Colors.grey : Colors.teal,
                        size: 18,
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isDelivery = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: greyColor), // Outline border
                    ),
                    padding: const EdgeInsets.all(8), // Optional: adjust as needed
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Delivery',style: TextStyle(color: Colors.black54),),
                      const SizedBox(width: 8),
                      Icon(
                        isDelivery ? Icons.check_circle : Icons.radio_button_off,
                        color: isDelivery ? btn2Color : greyColor,
                        size: 18,
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),

          // Delivery Fee
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee", style: TextStyle(fontSize: 16)),
              Text("Rs. 10.00", style: TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(),
          const SizedBox(height: 4),

          // Total Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                "Rs. 3260",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("3 items", style: TextStyle(fontSize: 16,color: Colors.black54)),
              Text("Include taxes", style: TextStyle(fontSize: 16,color: Colors.black54)),
            ],
          ),

          const SizedBox(height: 16),

          // Checkout Button
          TextButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(NamedRoutes.checkoutPage.name);
              },

              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 16, color: whiteColor),
              ),
            ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, {
        required String imagePath,
        required String author,
        required String title,
        required double price,
        required int quantity,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            imagePath,
            width: screenWidth * 0.18,
            height: screenWidth * 0.18,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    author,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: btn2Color,
                    ),
                  ),
                  Text(
                    'Rs.${price.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Qty: 1',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: greyColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('1'),
                      const SizedBox(width: 8),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          color: btn2Color,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

}
