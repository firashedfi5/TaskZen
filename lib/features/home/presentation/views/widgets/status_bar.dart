import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: Colors.black),
              label: const Text('To Do'),
              onSelected: (value) {},
            ),
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: Colors.black),
              label: const Text('Progress'),
              onSelected: (value) {},
            ),
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: Colors.black),
              label: const Text('Done'),
              onSelected: (value) {},
            ),
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: Colors.black),
              label: const Text('Cancelled'),
              onSelected: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
