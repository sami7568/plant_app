import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          hintText: "Search Here",
          hintStyle: const TextStyle(
              fontSize: 20
          ),
          fillColor: lightgreenColor,
          filled: true,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.mic),
        ),
      ),
    );
  }
}
