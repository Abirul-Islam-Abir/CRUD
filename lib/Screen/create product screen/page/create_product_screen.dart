import 'package:flutter/material.dart';
import 'package:rest_api/Rest%20Api/create%20data%20method/create_data_method.dart';
import 'package:rest_api/Widget/custom_text_field.dar.dart';

import '../../../Const/route name/routes_name.dart';
import '../../../Utils/navigate_method.dart';
import '../../../Utils/toast_method.dart';
import '../../../Utils/validator.dart';
import '../../../Widget/custom_button.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQtyController = TextEditingController();

  createProduct()async{
   var response = await createDataProduct(context,
        code: productCodeController.text.trim(),
        img: productImageController.text.trim(),
        name: productNameController.text.trim(),
        price: productPriceController.text.trim(),
        qty: productQtyController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data'),
      ),
      body: Form(

        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              validator: validateName,
              controller: productNameController,
              hintText: 'Enter Product Name',
              labelText: ' Product Name',
            ),
            CustomTextField(
              controller: productCodeController,
              hintText: 'Enter Product Code',
              labelText: 'Product Code',
            ),
            CustomTextField(
              validator: validateUrl,
              controller: productImageController,
              hintText: 'Enter image url link',
              labelText: 'Image',
            ),
            CustomTextField(
              controller: productPriceController,
              hintText: 'Enter Unit Price',
              labelText: 'Unit Price',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 02, color: Colors.grey),
                    color: Colors.grey.shade300),
                child: DropdownButton(
                  hint: const Text('Select Qty'),
                  value:'',
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
                    productQtyController.text = value!;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Create Product',
              onTap: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
