import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: currentPage == page ? primaryColor : Colors.grey,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: currentPage == page ? primaryColor : Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
