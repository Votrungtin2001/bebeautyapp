import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  final Cart item;
  final ValueChanged<bool> isSelected;

  const GridItem({Key? key, required this.item, required this.isSelected})
      : super(key: key);

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: isSelected
                ? Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.check_box,
                      color: kPrimaryColor,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.check_box_outline_blank,
                      color: kPrimaryColor,
                    ),
                  ),
          ),
          Container(
            width: 120,
            child: Image.asset(
              widget.item.product.images[0],
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.color,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 162,
            //color: kPrimaryColor.withOpacity(isSelected ? 0.05 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.item.product.title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "\$${widget.item.product.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                    Spacer(),
                    Text(" x${widget.item.numOfItem}",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
