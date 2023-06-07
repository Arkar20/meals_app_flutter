import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      body: SafeArea(child: 
        GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio:2 / 3,
          crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          children:const [
             Text("hello world"),
             Text("hello world"),
             Text("hello world"),
             Text("hello world"),
          ],
          )
      ),
    );
  }
}