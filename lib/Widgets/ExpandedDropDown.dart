import 'package:elmolad_dashboard/Widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class ExpandedDropDown extends StatefulWidget {
  final String text;
  final List dropDownList;
  final Function textChangeFunction;
  final Function searchFunction;

  const ExpandedDropDown(this.text, this.dropDownList , this.textChangeFunction ,this.searchFunction);
  @override
  _ExpandedDropDownState createState() => _ExpandedDropDownState();
}

class _ExpandedDropDownState extends State<ExpandedDropDown> {
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                width = 150;
                height = 300;
              });
            },
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xFFBFBFBF).withOpacity(0.4),
              ),
              padding: EdgeInsets.all(8),
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.text),
                  Icon(Icons.arrow_downward_outlined , size: 18,),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200) ,
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: CustomTextField(
                      "Search",
                      null,
                          (value)=>widget.searchFunction(value),
                    ),
                  ),
                  for(int i = 0 ; i < widget.dropDownList.length ; i++)
                    InkWell(
                      onTap: (){
                        widget.textChangeFunction(widget.dropDownList[i]);
                        setState(() {
                          width = 0;
                          height = 0;
                        });
                      },
                      hoverColor: Colors.lightBlueAccent,
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        width:150,
                          height: 40,
                          child: Center(child: Text(widget.dropDownList[i])),),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
