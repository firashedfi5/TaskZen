import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
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
