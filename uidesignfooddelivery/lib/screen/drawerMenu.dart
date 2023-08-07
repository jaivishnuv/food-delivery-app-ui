import 'package:flutter/material.dart';

import 'package:uidesignfooddelivery/utils/colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade800, primarycolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC8UX3CGsRxdzfcN1j-3SCUEztbqoOJ2uXH9q5GAKUug&usqp=CAU&ec=48665699"),
                ),
                accountName: Text(
                  "Your Name ",
                  style: TextStyle(color: Colors.white30),
                ),
                accountEmail: Text(
                  "youremail@gmail.com",
                  style: TextStyle(color: Colors.black54),
                )),
            MenuList(title: "Orders", iconName: Icons.border_color),
            MenuList(iconName: Icons.bookmark, title: "Address"),
            MenuList(iconName: Icons.notifications, title: "Notifications"),
            MenuList(iconName: Icons.help, title: "Help"),
            MenuList(iconName: Icons.account_box, title: "About"),
            MenuList(iconName: Icons.star_half, title: "Rate us "),
            MenuList(iconName: Icons.exit_to_app, title: "Logout"),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatefulWidget {
  final String title;
  final IconData iconName;

  const MenuList({
    super.key,
    required this.title,
    required this.iconName,
  });

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.transparent,
        child: Icon(widget.iconName),
      ),
      title: Text(
        widget.title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
