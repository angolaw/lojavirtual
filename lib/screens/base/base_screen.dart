import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageManager(
        pageController: pageController,
      ),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            drawer: CustomDrawer(),
          ),
          Container(
            color: Colors.red,
            child: ElevatedButton(
                onPressed: () {
                  pageController.jumpToPage(1);
                },
                child: Text("Proximo")),
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
