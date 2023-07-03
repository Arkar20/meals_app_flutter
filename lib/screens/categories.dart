import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/store/FilterProvider.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
        lowerBound: 0,
        upperBound: 1);

        animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(filterMealProviders);

    return AnimatedBuilder(
      animation: animationController,
      builder: ((context, child) => SlideTransition(position: Tween(
        end: const Offset(0,0),
        begin:const  Offset(0.5, 0),
      ).animate(CurvedAnimation(curve: Curves.easeInCubic,parent: animationController)),
      child: child,)),
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              meals: meals,
            )
        ],
      ),
    );
  }
}
