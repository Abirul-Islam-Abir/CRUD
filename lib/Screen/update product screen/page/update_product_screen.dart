import 'package:flutter/material.dart';
import 'package:rest_api/Const/route%20name/routes_name.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Rest%20Api/update%20data%20method/update_data_method.dart';
import 'package:rest_api/Utils/toast_method.dart';
import 'package:rest_api/Widget/custom_text_field.dar.dart';

import '../../../Utils/navigate_method.dart';
import '../../../Utils/validator.dart';
import '../../../Widget/custom_button.dart';

//https://dart.dev/assets/img/shared/dart/logo+text/horizontal/white.svg
class UpdateProductScreen extends StatefulWidget {
  final GetDataProduct getDataProduct;

  const UpdateProductScreen({super.key, required this.getDataProduct});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController productNameController =
      TextEditingController(text: widget.getDataProduct.productName);
  late TextEditingController productCodeController =
      TextEditingController(text: widget.getDataProduct.productCode);
  late TextEditingController productImageController =
      TextEditingController(text: widget.getDataProduct.img);
  late TextEditingController productPriceController =
      TextEditingController(text: widget.getDataProduct.unitPrice);
  String productQtyController = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // productQtyController = widget.getDataProduct.qty!;
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //when back button press again navigate homePage
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: Form(
          key: formKey,
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
                    value: productQtyController,
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
                      productQtyController = value!;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Update Product',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (productQtyController.isEmpty) {
                      displayErrorMotionToast(context);
                    } else {
                      updateDataProduct(context,
                          imgUrl: productImageController.text.trim(),
                          productCode: productCodeController.text.trim(),
                          productName: productNameController.text.trim(),
                          qty: productQtyController,
                          totlaPrice: productPriceController.text.trim(),
                          unitPrice: productPriceController.text.trim(),
                          id: widget.getDataProduct.sId);
                      pushOffAllNavigate(
                          context: context, screenName: RouteName.homePage);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
