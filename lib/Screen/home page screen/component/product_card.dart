import 'package:flutter/material.dart';

class PrductCard extends StatelessWidget {
  const PrductCard({
    super.key,
    required this.img,
    required this.productName,
    required this.editPress,
    required this.deletePress,
    required this.productCode,
    required this.totalPrice,
    this.onTap,
    this.tag,
  });
  final String img;
  final String productName;
  final Function() editPress;
  final Function() deletePress;
  final String productCode;
  final String totalPrice;
  final Function()? onTap;
  final dynamic tag;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.yellow,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: tag,
                  child: Image.network(
                    img,
                    height: 100,
                    width: 150,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) => Image.network(
                      'https://media.tenor.com/2hNqKj3ArX8AAAAi/loading.gif',
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '$productName $productCode',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              Text(
                '\$$totalPrice',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: editPress,
                      child: const Icon(Icons.edit)),
                  const SizedBox(width: 5),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: deletePress,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
