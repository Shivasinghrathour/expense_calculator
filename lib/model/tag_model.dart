import 'package:flutter/material.dart';
import 'package:get/get.dart';

// model for tags it contains tagid, tagName and tagcolor also.
class Tag {
  final String tagName;
  final Color tagColor;

  Tag({required this.tagColor, required this.tagName});
}

// list of predefine tags

RxList<Tag> predefinedTags = [
  Tag(tagColor: Colors.red, tagName: "Food"),
  Tag(tagColor: Colors.green, tagName: "Grosery"),
  Tag(tagColor: Colors.blue, tagName: "Amazon Prime"),
  Tag(tagColor: Colors.deepOrange, tagName: "Netflix"),
  Tag(tagColor: Colors.yellowAccent, tagName: "Entertainment"),
].obs;
