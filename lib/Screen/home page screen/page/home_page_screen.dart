import 'package:flutter/material.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Rest%20Api/delete%20data%20method/delete_data_method.dart';
import 'package:rest_api/Rest%20Api/get%20data%20method/get_data_method.dart';
import 'package:rest_api/Screen/create%20product%20screen/page/create_product_screen.dart';
import 'package:rest_api/Screen/home%20page%20screen/component/product_card.dart';
import 'package:rest_api/Screen/update%20product%20screen/page/update_product_screen.dart';
import 'package:rest_api/Utils/navigate_method.dart';
import 'package:rest_api/Utils/toast_method.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<GetDataProduct> getDataProduct = [];
  //bool isLoading = false;
  Future fetchData() async {
    getDataProduct.clear();
    await fetchDataProduct().then((value) {
      for (Map<String, dynamic> json in value) {
        getDataProduct.add(GetDataProduct.fromJson(json));
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        displayDeleteMotionToast(context);
      }),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () => pushNavigate(
                  context: context, screenName: const CreateProductScreen()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: fetchDataProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Error has occured');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                displaySuccessMotionToast(context);
                await fetchData();
              },
              child: GridView.builder(
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
                          pushNavigate(
                              context: context,
                              screenName: UpdateProductScreen(
                                  getDataProduct: getDataProduct[index]));
                        },
                        deletePress: () {
                          deleteProduct(
                              context: context,
                              id: '${getDataProduct[index].sId}');
                        },
                      )),
            );
          }),
    );
  }

  deleteProduct({required BuildContext context, required id}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                Navigator.pop(context);
                // Close the dialog
                deleteDataProduct(context, id: id);
                await fetchData();
              },
            ),
          ],
        );
      },
    );
  }
}
