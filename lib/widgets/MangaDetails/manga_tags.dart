import 'package:flutter/material.dart';
import 'package:fluttiyomi/data/tag_section/tag_section.dart';

class MangaTags extends StatelessWidget {
  final TagSection tagSection;

  const MangaTags({
    Key? key,
    required this.tagSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: -10,
      children: tagSection.tags
          .map(
            (e) => Chip(
              padding: const EdgeInsets.all(3),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              label: Text(
                e.label,
                style: const TextStyle(
                    // fontSize: 10,
                    ),
              ),
            ),
          )
          .toList(),
    );
  }
}
