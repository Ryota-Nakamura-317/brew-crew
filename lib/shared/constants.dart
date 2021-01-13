import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  //入力窓の背景色の変更
  fillColor: Colors.white,
  filled: true,
  //入力フォームのボーダー設定（選択されていない時enabled)
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  //入力フォームのボーダー設定（選択されている時focused)
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);
