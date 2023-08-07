import 'package:flutter/material.dart';

class Offerpage extends StatefulWidget {
  const Offerpage({super.key});

  @override
  State<Offerpage> createState() => _OfferpageState();
}

class _OfferpageState extends State<Offerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 15, right: 15),
            child: Image.network(
                'https://assets.grab.com/wp-content/uploads/sites/8/2020/02/06141101/LMMY1748-OC-NEW2GF_edm-1200x660.gif'),
          ),
          Image.network(
            'https://media.tenor.com/FUR8taaI51IAAAAC/order-now.gif',
            scale: 1.5,
          )
        ],
      ),
    );
  }
}
