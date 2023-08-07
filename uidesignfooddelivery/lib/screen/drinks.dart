import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  final List<String> drinksList = [
    'https://www.liquor.com/thmb/5AkaSwYjcJGJzmyfz90ISoHGYp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/mental-note-720x720-primary-ea114cf51d114c8b9413cfdb8c6fe483.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0pta3MIsvYurrSxEid1SdK1GRtWh_rxXQXiPwFu2HLg&usqp=CAU&ec=48665699',
    'https://c1.wallpaperflare.com/preview/338/571/673/cocktail-bar-nightlife-icee.jpg',
    'https://images.unsplash.com/photo-1587888637140-849b25d80ef9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGRyaW5rfGVufDB8fDB8fHww&w=1000&q=80',
    'https://img.freepik.com/premium-photo/blue-mojito-with-mint-lemon-ice-cube_587392-71.jpg?w=2000'
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
          "Drinks",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
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
                drinksdisplaymethod(
                    bannerList: drinksList[0],
                    foodname: 'Appe Fizz',
                    rating: '4',
                    rating2: '(128 ratings)',
                    price: '\$5',
                    place: 'Cafe Western Food'),
                drinksdisplaymethod(
                    bannerList: drinksList[1],
                    foodname: 'Orange Cocktail ',
                    rating: '5',
                    rating2: '(111 ratings)',
                    price: '\$7',
                    place: 'Dominoz'),
                drinksdisplaymethod(
                    bannerList: drinksList[2],
                    foodname: 'Rainbow Cocktail',
                    rating: '3',
                    rating2: '(98 ratings)',
                    price: '\$8',
                    place: 'KFC'),
                drinksdisplaymethod(
                    bannerList: drinksList[3],
                    foodname: 'Blue ice',
                    rating: '4',
                    rating2: '(199 ratings)',
                    price: '\$10',
                    place: 'De la cafe'),
                drinksdisplaymethod(
                    bannerList: drinksList[4],
                    foodname: 'Blue Mojitto',
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

  Column drinksdisplaymethod(
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
