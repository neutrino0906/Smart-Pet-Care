import 'package:flutter/material.dart';
// import '../SingleProdScreen.dart';

// ignore: must_be_immutable
class SingleProdTile extends StatelessWidget {
  // SingleProdTile({super.key});

  String image;
  String name;
  String price;

  SingleProdTile(
      {this.image = "Prod_1.png", this.name = "Product", this.price = "\$50"});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 216, 213, 213),
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          SizedBox(width: 15),
          Image.asset(image),
          SizedBox(width: 20),
          Container(
            width: 2,
            height: double.infinity,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                price,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 125, 6, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 125, 6, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 125, 6, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromRGBO(255, 125, 6, 1),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
