import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerTile(iconData: Icons.home, title: "Inicio"),
          const DrawerTile(iconData: Icons.list, title: "Produtos"),
          const DrawerTile(
              iconData: Icons.playlist_add_check, title: "Meus Pedidos"),
          const DrawerTile(iconData: Icons.location_on, title: "Lojas"),
        ],
      ),
    );
  }
}
