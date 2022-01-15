
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({ Key? key }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex=0;
  final List<String> Categories=["Messages","Online","Groupes","Requests"];

  @override
   Widget build(BuildContext context) {
    return Container(
     height: 90.0, 
     color: Theme.of(context).primaryColor,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: Categories.length,
       itemBuilder: (BuildContext context,int index){
       return GestureDetector(
         onTap: (){
           setState(() {
             selectedIndex = index;
           });
         },
       child : Padding(
         padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
         child :Text(Categories[index] , style: TextStyle(
           color: index == selectedIndex ? Colors.white:Colors.white60,
           fontSize: 24.0,
           fontWeight: FontWeight.bold,
           letterSpacing: 1.2,
         ),),
       )
       );
       }
       ),
    );
  }
}