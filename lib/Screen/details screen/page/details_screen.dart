import 'package:flutter/material.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Utils/text_style.dart';
import 'package:rest_api/Widget/text_design.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.getDataProduct});
  final GetDataProduct getDataProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            SizedBox(
              height: size.height / 2.5,
              width: size.width,
              child: Hero(
                tag: '${getDataProduct.sId}',
                child: Image.network(
                  '${getDataProduct.img}',
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    'https://media.tenor.com/2hNqKj3ArX8AAAAi/loading.gif',
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDesign(
                  text:
                      '${getDataProduct.productName} ${getDataProduct.productCode}',
                  style: headlineMedium(color: Colors.green),
                ),
                const SizedBox(height: 5),
                TextDesign(
                    text: 'Price: \$${getDataProduct.totalPrice}',
                    style: headlineTooSmall()),
                const SizedBox(height: 5),
                TextDesign(
                    text: 'Qty: ${getDataProduct.qty}', style: titleLarge()),
                const SizedBox(height: 5),
                TextDesign(
                    text: 'Created Date: ${getDataProduct.createdDate}',
                    style: titleLarge()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
