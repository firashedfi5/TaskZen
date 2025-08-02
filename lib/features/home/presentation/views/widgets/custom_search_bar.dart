import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 45,
          child: SearchBar(
            shadowColor: const WidgetStatePropertyAll(Colors.transparent),
            leading: const Icon(Icons.search),
            hintText: 'Search',
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            // backgroundColor: const WidgetStatePropertyAll(kTertiaryColor),
          ),
        ),
      ),
    );
  }
}
