import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/features/home/presentation/manager/filtering_cubit/filtering_cubit.dart';

class StatusBar extends StatefulWidget {
  const StatusBar({super.key});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  String? selectedItem;

  final List<String> statusOptions = ['To Do', 'Progress', 'Done', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: statusOptions.map((status) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: buildFilterChip(status),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildFilterChip(String status) {
    final bool isSelected = selectedItem == status;

    return FilterChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      side: BorderSide(color: isSelected ? kSecondaryColor : Colors.black),
      label: Text(
        status,
        style: isSelected
            ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            : null,
      ),
      showCheckmark: false,
      selected: isSelected,
      onSelected: (value) {
        setState(() {
          selectedItem = value ? status : null;
        });
        if (selectedItem != null) {
          // log(selectedItem!);
          BlocProvider.of<FilteringCubit>(
            context,
          ).fetchTasksByStatus(selectedItem!);
        } else {
          log("No status selected, maybe fetch all tasks here");
          // BlocProvider.of<FilteringCubit>(context).fetchAllTasks();
        }
      },
      selectedColor: kSecondaryColor,
    );
  }
}
