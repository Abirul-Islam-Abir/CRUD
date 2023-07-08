import 'package:flutter/material.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Rest%20Api/get%20data%20method/get_data_method.dart';
import 'package:rest_api/Rest%20Api/update%20data%20method/update_data_method.dart';
import 'package:rest_api/Widget/custom_text_field.dar.dart';

//https://dart.dev/assets/img/shared/dart/logo+text/horizontal/white.svg
class UpdateProductScreen extends StatefulWidget {
  final getDataProducts;

  const UpdateProductScreen({super.key, required this.getDataProducts});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  Map<String, dynamic> formValue = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "UnitPrice": "",
    "Qty": "",
    "TotalPrice": "",
  };
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Data')),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CustomTextField(
            initialValue: '${widget.getDataProducts.productName}',
            hintText: 'Product Name',
            labelText: 'Enter Product Name',
          ),
          CustomTextField(
            initialValue: '${widget.getDataProducts.img} ',
            hintText: 'Image',
            labelText: 'Enter image url link',
          ),
          CustomTextField(
            initialValue: '${widget.getDataProducts.productCode}',
            hintText: 'Product Code',
            labelText: 'Enter Product Code',
          ),
          CustomTextField(
            initialValue: '${widget.getDataProducts.unitPrice}',
            hintText: 'Unit Price',
            labelText: 'Enter Unit Price',
          ),
          CustomTextField(
            initialValue: '${widget.getDataProducts.totalPrice}',
            hintText: 'Total Price',
            labelText: 'Enter Total Price',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 02, color: Colors.grey),
                  color: Colors.grey.shade300),
              child: DropdownButton(
                value: '',
                isExpanded: true,
                underline: Container(),
                items: const [
                  DropdownMenuItem(
                    value: '',
                    child: Text('Select Qty'),
                  ),
                  DropdownMenuItem(
                    value: '1',
                    child: Text('1 Pcs'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('2 Pcs'),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text('3 Pcs'),
                  ),
                  DropdownMenuItem(
                    value: '4',
                    child: Text('4 Pcs'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
                onPressed: () {
                  updateProductData(
                    imgUrl: widget.getDataProducts.img,
                    prdoductCode: widget.getDataProducts.productCode,
                    productName: widget.getDataProducts.productName,
                    qty: widget.getDataProducts.qty,
                    totlaPrice: widget.getDataProducts.totalPrice,
                    unitPrice: widget.getDataProducts.unitPrice,
                    id: widget.getDataProducts.sId,
                  );
                },
                child: const Text('Update')),
          )
        ],
      ),
    );
  }
}
