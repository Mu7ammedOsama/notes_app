import 'package:flutter/material.dart';

// dependencies
import 'package:flutter_bloc/flutter_bloc.dart';

// constants
import 'package:notes_app/constants.dart';

// cubits
import 'package:notes_app/cubits/addNotesCubit/addNoteCubit.dart';

// widgets
import 'package:notes_app/widgets/colorItems.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => setState(() {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
            }),
            child: ColorItems(
              isSelected: currentIndex == index,
              color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
