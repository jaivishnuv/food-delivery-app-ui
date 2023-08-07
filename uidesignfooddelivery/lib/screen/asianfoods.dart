import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Asian extends StatefulWidget {
  const Asian({super.key});

  @override
  State<Asian> createState() => _AsianState();
}

class _AsianState extends State<Asian> {
  final List<String> asianFoodList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiSC3v9o7cYmGLtGSfqQnBq77_yqiZ4VVQF1JIbiWsBg&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOzHYAszVzvHcqtAR7kxzPpq5t4_1eUyxlET5Dhncl8A&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD99gRnk2fJMPOobhBZLlpLGZRalsIatJnn5-SBT9mWw&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnstLMD9zAQsf3OHBkzCLqp7bh_3MJC3zTJxmrxUDiEA&usqp=CAU&ec=48665699',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpJYto39i1NCHGzEJ-A4wledYtMnLiNZnupw1nLm9TyQ&usqp=CAU&ec=48665699'
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
          "Asian Foods",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left:10, right:10),
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
                asiandisplaymethod(
                    bannerList: asianFoodList[0],
                    foodname: 'Maltese',
                    rating: '4',
                    rating2: '(128 ratings)',
                    price: '\$5',
                    place: 'Cafe Western Food'),
                asiandisplaymethod(
                    bannerList: asianFoodList[1],
                    foodname: 'Sicilian ',
                    rating: '5',
                    rating2: '(111 ratings)',
                    price: '\$7',
                    place: 'Dominoz'),
                asiandisplaymethod(
                    bannerList: asianFoodList[2],
                    foodname: 'Quatro Formaggi',
                    rating: '3',
                    rating2: '(98 ratings)',
                    price: '\$8',
                    place: 'KFC'),
                asiandisplaymethod(
                    bannerList: asianFoodList[3],
                    foodname: 'Tuna and Corn',
                    rating: '4',
                    rating2: '(199 ratings)',
                    price: '\$10',
                    place: 'De la cafe'),
                asiandisplaymethod(
                    bannerList: asianFoodList[4],
                    foodname: 'Hawaiian',
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

  Column asiandisplaymethod(
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
