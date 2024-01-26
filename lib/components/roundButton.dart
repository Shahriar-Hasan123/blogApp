import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {

  final String tittle;
  final VoidCallback onPress;

  roundButton({required this.tittle, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.deepOrange,
        height: 50,
        minWidth: double.infinity,
        child: Text(tittle,style: TextStyle(color: Colors.white),),
        onPressed: onPress,
        ),
    );
  }
}