import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  final List<String> burgerList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSESQ3pX5Wh1IKXqnLIN0v6dwXVvQHAMzYUh5_c2cQzjA&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxtENG0qYHcBw5OVIIsL4klcfmD2t6MRclPqswYGxxkg&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8INE-UFBOz4Lo2TpsIDGL5YhFpIbR36DoXFcVfOT0Ng&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpMr79wPvsJHZ2sTDFMCpeLfd2Qjz_Is6-DERHFKzNBA&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS05RjKpc5vWuvK2GUYKE3T8fXe_b85mmUb7vF-b0HDYA&usqp=CAU&ec=48665699'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Burger",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left :10, right: 10),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 5,
                      blurRadius: 5)
                ]),
            child: Column(
              children: [
                burgerdisplaymethod(
                    bannerList: burgerList[0],
                    foodname: 'Black Beef burger',
                    rating: '4',
                    rating2: '(128 ratings)',
                    price: '\$5',
                    place: 'Cafe Western Food'),
                burgerdisplaymethod(
                    bannerList: burgerList[1],
                    foodname: 'Spicy Food Station ',
                    rating: '5',
                    rating2: '(111 ratings)',
                    price: '\$7',
                    place: 'Dominoz'),
                burgerdisplaymethod(
                    bannerList: burgerList[2],
                    foodname: 'Big Daddy - Double Chess',
                    rating: '3',
                    rating2: '(98 ratings)',
                    price: '\$8',
                    place: 'KFC'),
                burgerdisplaymethod(
                    bannerList: burgerList[3],
                    foodname: 'Veggie Plate',
                    rating: '4',
                    rating2: '(199 ratings)',
                    price: '\$10',
                    place: 'De la cafe'),
                burgerdisplaymethod(
                    bannerList: burgerList[4],
                    foodname: 'Egg fried Burger ',
                    rating: '5',
                    rating2: '(288 ratings)',
                    price: '\$12',
                    place: 'Frenchtown'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column burgerdisplaymethod(
      {required bannerList,
      required String foodname,
      required String rating,
      required String rating2,
      required String price,
      required String place}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(bannerList), fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            foodname,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: primarycolor,
              ),
              Text(
                rating,
                style: TextStyle(color: primarycolor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text((rating2)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(place),
              ),
              Text(price),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
