import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:flutter/material.dart';

class PhotoViwerWidget extends StatelessWidget {
  final List imageName;
  final Function deleteImage;

  const PhotoViwerWidget(this.imageName,this.deleteImage);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageName.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,

          mainAxisSpacing: 10 ,crossAxisSpacing: 1/100 ),
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Image.network(
              "$serverURL/img/products/${imageName[index]}", fit: BoxFit.fitHeight,
            ),
            Container(
              margin: EdgeInsets.only(left: 80,top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.red.withOpacity(0.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 0),// changes position of shadow
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => deleteImage(imageName[index]),
                child: Container(
                    width:20,
                    height:20,
                    child: Text("X" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 16),textAlign: TextAlign.center,)),
              ),
            ),
          ],
        );
      },
    );
  }
}
