import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uidesignfooddelivery/screen/asianfoods.dart';
import 'package:uidesignfooddelivery/screen/burger.dart';
import 'package:uidesignfooddelivery/screen/drinks.dart';
import 'package:uidesignfooddelivery/screen/offerpage.dart';
import 'package:uidesignfooddelivery/screen/pizza.dart';

import '../utils/colors.dart';
import 'drawermenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannerList = [
    'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1487511/pexels-photo-1487511.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1213710/pexels-photo-1213710.jpeg?auto=compress&cs=tinysrgb&w=600'
  ];

  double translateX = 0.0;
  double translateY = 0.0;
  double scale = 1;

  bool toggle = false;

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listCards = [
      CategoryModel(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo3WJTmbdDQl4W9LtCgY_NHrZbk-uyOZo6W2yqYvjDRw&usqp=CAU&ec=48665699",
          "Offers",
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Offerpage()))),
      CategoryModel(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLclnah5eCqE7L2vAAsdX0EAlZxOvd25SiY4Et4vXssw&usqp=CAU&ec=48665699",
          "Drinks",
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Drinks()))),
      CategoryModel(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDubWzLe_Ogvvaw3yADOnSCcvOAdtJRUySn-nB1kBxBA&usqp=CAU&ec=48665699",
          "Asian",
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Asian()))),
      CategoryModel(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS09Xx5Hyg8MnKNuP0VA5wSVx0OI2E8WcSwNo6TSQpmcw&usqp=CAU&ec=48665699",
          "Pizza",
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Pizza()))),
      CategoryModel(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStMTSxl78I5MiK7laaBEtFYYKb2ZbE3Uf4Kvjlfz_MRw&usqp=CAU&ec=48665699",
          "Burger",
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Burger()))),
    ];
    return Stack(
      children: [
        const DrawerMenu(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(translateX, translateY, 0)
            ..scale(scale),
          child: ClipRRect(
            borderRadius:
                (toggle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.black,
                      progress: _animationController,
                    ),
                    onPressed: () {
                      toggle = !toggle;
                      if (toggle) {
                        translateX = 200;
                        translateY = 80;
                        scale = 0.8;
                        _animationController.forward();
                      } else {
                        translateX = 0.0;
                        translateY = 0.0;
                        scale = 1;
                        _animationController.reverse();
                      }
                      setState(() {});
                    }),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delevering to",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: Colors.black45),
                        ),
                        InkWell(
                          onTap: () {
                            print("Clicked");
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Current Location",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: primarycolor,
                                size: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30)),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.search),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Search Foods",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwwMCWQ9-L0mt9Tg5_a6qGCC_IsUIb5EEklfH-6waGRw&usqp=CAU&ec=48665699"),
                          color: primarycolor,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    titleWidget(context, "Category"),
                    Container(
                      height: 115,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listCards.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              categoryModel: listCards[index],
                            );
                          }),
                    ),
                    titleWidget(context, "Popular"),
                    Container(
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
                          bannermethod(
                              bannerList: bannerList[0],
                              foodname: 'French Fries',
                              rating: '4',
                              rating2: '(128 ratings)',
                              price: '\$5',
                              place: 'Cafe Western Food'),
                          bannermethod(
                              bannerList: bannerList[1],
                              foodname: 'Pizza ',
                              rating: '5',
                              rating2: '(111 ratings)',
                              price: '\$7',
                              place: 'Dominoz'),
                          bannermethod(
                              bannerList: bannerList[2],
                              foodname: 'Burger',
                              rating: '3',
                              rating2: '(98 ratings)',
                              price: '\$8',
                              place: 'KFC'),
                          bannermethod(
                              bannerList: bannerList[3],
                              foodname: 'Pasta',
                              rating: '4',
                              rating2: '(199 ratings)',
                              price: '\$10',
                              place: 'De la cafe'),
                          bannermethod(
                              bannerList: bannerList[4],
                              foodname: 'Veggie Salad',
                              rating: '5',
                              rating2: '(288 ratings)',
                              price: '\$12',
                              place: 'Frenchtown'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }

  Column bannermethod(
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

  Widget titleWidget(BuildContext context, String title) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18));
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
              onTap: categoryModel.onpressed,
              child: Image.network(categoryModel.imageurl)),
        ),
        Text(categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87))
      ],
    );
  }
}

class CategoryModel {
  String imageurl;
  String title;
  final VoidCallback onpressed;

  CategoryModel(this.imageurl, this.title, this.onpressed);
}
