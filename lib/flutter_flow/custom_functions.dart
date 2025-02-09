import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? removeBrackets(List<String>? inputList) {
  if (inputList == null || inputList.isEmpty) {
    return null;
  }
  return inputList.join(', ');
}

bool checkEMail(String? email) {
  if (email == null || email.isEmpty || email.length > 254) {
    return false;
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
