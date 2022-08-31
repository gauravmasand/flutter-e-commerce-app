import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_ui/utils/ItemModel.dart';

class ItemPage extends StatefulWidget {
  late ItemModel itemModel;
  ItemPage({Key? key, required this.itemModel}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {

  late int id, price;
  late String title, desc, image;
  late double width, height;
  int count = 0;

  setDimension() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  void initState() {
    id = widget.itemModel.id;
    price = widget.itemModel.price;
    title = widget.itemModel.title;
    desc = widget.itemModel.desc;
    image = widget.itemModel.image;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setDimension();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 28, top: 10),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(CupertinoIcons.back),
              
            ),
          ),
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.lightBlue.withOpacity(0.05),
          title: const Text(
            "Face Wash",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 28, top: 10),
              child: Icon(Icons.align_horizontal_right),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(height: 10, color: Colors.white,),
              Hero(
                child: Image.asset(image),
                tag: Key(id.toString()),
              ),
              Container(height: 10, color: Colors.white,),
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: SizedBox(
                  height: 101,
                  width: 1000,
                  child: Row(
                    children: [
                      Spacer(),
                      Highlight("Natural", "assets/img/plant.png"),
                      Spacer(),
                      Highlight("Best", "assets/img/face.png"),
                      Spacer(),
                      Highlight("Recyclable", "assets/img/recycle.png"),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Container(height: 10, color: Colors.white,),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          width: width*0.45,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Text(
                                  desc,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.black,),
                                  Icon(Icons.star, color: Colors.black,),
                                  Icon(Icons.star, color: Colors.black,),
                                  Icon(Icons.star, color: Colors.black,),
                                  Icon(Icons.star, color: Colors.grey,),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "238 reviews",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          "₹$price",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(color: Colors.black45, spreadRadius: 1)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Ink(
                                    child: Text("-"),
                                  ),
                                  onTap: () {
                                    if (count>0) {
                                      setState(() => count--);
                                    }
                                  },
                                ),
                                SizedBox(width: 15,),
                                Text("$count"),
                                SizedBox(width: 15,),
                                InkWell(
                                  child: Ink(
                                    child: Text("+"),
                                  ),
                                  onTap: () {
                                    setState(() => count++);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.fromLTRB(20,10,20,10),
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Highlight(String title, String image) {
    return Container(
      alignment: Alignment.center,
      height: 101,
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.lightBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children:[
          Image.asset(image, width: 50,),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

}
