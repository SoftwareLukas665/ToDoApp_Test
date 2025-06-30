import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;

  late String name;
  late String? details;
}
