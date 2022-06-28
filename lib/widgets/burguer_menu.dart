import 'package:flutter/material.dart';

class BurguerMenu extends StatelessWidget {
  const BurguerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pet.png"),
              ),
            ),
          ),
          ExpansionTile(
            title: Text("Expansion Title"),
            children: <Widget>[Text("children 1"), Text("children 2")],
          ),
          ExpansionTile(
            title: Text("Expansion Title"),
            children: <Widget>[Text("children 1"), Text("children 2")],
          )
        ],
      ),
    );
  }
}
