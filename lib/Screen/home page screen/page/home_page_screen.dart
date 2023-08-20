import 'package:flutter/material.dart';
import 'package:rest_api/Model/get_data_model.dart';
import 'package:rest_api/Rest%20Api/delete%20data%20method/delete_data_method.dart';
import 'package:rest_api/Rest%20Api/get%20data%20method/get_data_method.dart';
import 'package:rest_api/Screen/create%20product%20screen/page/create_product_screen.dart';
import 'package:rest_api/Screen/details%20screen/page/details_screen.dart';
import 'package:rest_api/Screen/home%20page%20screen/component/product_card.dart';
import 'package:rest_api/Screen/update%20product%20screen/page/update_product_screen.dart';
import 'package:rest_api/Utils/navigate_method.dart';
class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}
class _HomePageScreenState extends State<HomePageScreen> {
  List<GetDataProduct> getDataProduct = [];
  bool isLoading = true;

  fetchData() async {
    getDataProduct.clear();
    setState(() {
      isLoading = true;
    });
    await fetchDataProduct().then((value) {
      setState(() {
        for (var json in value) {
          getDataProduct.add(GetDataProduct.fromJson(json));
        }
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CreateProductScreen(),
                    )),
                icon: const Icon(Icons.add))
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              fetchData();
            },
            child: isLoading
                ? Center(
                    child: RefreshProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: getDataProduct.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 230),
                    itemBuilder: (context, index) => PrductCard(
                          tag: getDataProduct[index].sId,
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                getDataProduct: getDataProduct[index]),
                          )),
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
                        ))));
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
                var response = await deleteDataProduct(context, id: id);
                if (response == true) {
                  fetchData();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
