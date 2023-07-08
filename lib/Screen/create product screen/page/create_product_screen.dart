import 'package:flutter/material.dart';
import 'package:rest_api/Rest%20Api/create%20data%20method/create_data_method.dart';
import 'package:rest_api/Screen/home%20page%20screen/page/home_page_screen.dart';
import 'package:rest_api/Widget/custom_text_field.dar.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  Map<String, dynamic> formValue = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "UnitPrice": "",
    "Qty": "",
    "TotalPrice": "",
  };
  void onChange({key, value}) {
    setState(() {
      formValue[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Data')),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20),
          CustomTextField(
            onChange: (value) {
              onChange(key: 'ProductName', value: value);
            },
            initialValue: formValue['ProductName'],
            hintText: 'Product Name',
            labelText: 'Enter Product Name',
          ),
          CustomTextField(
            onChange: (value) {
              onChange(key: 'ProductCode', value: value);
            },
            initialValue: formValue['ProductCode'],
            hintText: 'Product Code',
            labelText: 'Enter Product Code',
          ),
          CustomTextField(
            onChange: (value) {
              onChange(key: 'Img', value: value);
            },
            initialValue: formValue['Img'],
            hintText: 'Image',
            labelText: 'Enter image url link',
          ),
          CustomTextField(
            onChange: (value) {
              onChange(key: 'UnitPrice', value: value);
            },
            initialValue: formValue['UnitPrice'],
            hintText: 'Unit Price',
            labelText: 'Enter Unit Price',
          ),
          CustomTextField(
            onChange: (value) {
              onChange(key: 'TotalPrice', value: value);
            },
            initialValue: formValue['TotalPrice'],
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
                hint: const Text('Select Qty'),
                value: formValue['Qty'],
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
                  DropdownMenuItem(
                    value: '5',
                    child: Text('5 Pcs'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    formValue['Qty'] = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                onPressed: () {
                  createProduct(formValue: formValue);
                },
                child: const Text('Create Data')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePageScreen(),
          ));
        },
        child: const Text('Go'),
      ),
    );
  }
}
