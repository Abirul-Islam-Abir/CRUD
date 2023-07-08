import 'package:flutter/material.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Rest%20Api/delete%20data%20method/delete_data_method.dart';
import 'package:rest_api/Rest%20Api/get%20data%20method/get_data_method.dart';
import 'package:rest_api/Screen/home%20page%20screen/component/product_card.dart';
import 'package:rest_api/Screen/update%20product%20screen/page/update_product_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<GetDataProduct> getDataProduct = [];

  @override
  void initState() {
    super.initState();
    getProductData().then((value) {
      for (var item in value) {
        getDataProduct.add(GetDataProduct.fromJson(item));
        setState(() {});
      }
    });
  }

  bool isLoading = false;

  deleteProduct({required BuildContext context, required id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure you want to delete this product?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                Navigator.pop(context);
                // Close the dialog
                await deleteProductData(id: id);

                setState(() {
                  isLoading = true;
                });
                getDataProduct.clear();
                getProductData().then((value) {
                  for (var item in value) {
                    getDataProduct.add(GetDataProduct.fromJson(item));
                  }
                  isLoading = false;
                  setState(() {});
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              isLoading = true;
            });
            getProductData().then((value) {
              setState(() {
                isLoading = false;
              });
            });
          },
          child: isLoading
              ? const LinearProgressIndicator()
              : GridView.builder(
                  itemCount: getDataProduct.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 230),
                  itemBuilder: (context, index) => PrductCard(
                        totalPrice: '${getDataProduct[index].totalPrice}',
                        productCode: '${getDataProduct[index].productCode}',
                        img: '${getDataProduct[index].img}',
                        productName: '${getDataProduct[index].productName}',
                        editPress: () {
                          //=====================================
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => UpdateProductScreen(
                              getDataProducts: getDataProduct[index],
                            ),
                          ));
                        },
                        deletePress: () {
                          deleteProduct(
                              context: context,
                              id: '${getDataProduct[index].sId}');
                        },
                      )),
        ));
  }
}
