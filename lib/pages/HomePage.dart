import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_page_ui/pages/ItemPage.dart';
import 'package:home_page_ui/utils/ItemModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double width, height;

  setDimension() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    setDimension();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 28, top: 10),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Image.asset("assets/img/drawer_icon.png"),
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)
                ),
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                child: Image.asset(
                  "assets/img/profile.jpeg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Container(
            color: Colors.lightBlue.withOpacity(0.05),
            child: Container(
              padding: EdgeInsets.fromLTRB(width*0.06,width*0.05,width*0.06,0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width*0.67,
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                            // prefixIcon: Icon(),
                            prefixIcon: const IconTheme(
                                data: IconThemeData(
                                  color: Colors.black87,
                                ),
                                child: Icon(CupertinoIcons.search,),
                            ),

                            hintText: "Search here...",
                            labelStyle: const TextStyle(
                                color: Colors.black
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.white
                              ),
                            ),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.white
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {Fluttertoast.showToast(msg: "Coming soon...");},
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/img/option.png",
                              width: 25,
                              height: 25,
                              color: Colors.black87,
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    children: [
                      const Text(
                        "For You",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      ListItem(1, "PALMOLIVE Blush", "PALMOLIVE Blush & Glow Strawberry Combo Face Wash With Fruit Extracts, 100 g", 170, "assets/img/170.jpg"),
                      ListItem(2, "Muuchstac Ocean", " Face Wash for Men, Fights Acne & Pimple, Skin Whitening ", 249, "assets/img/249.jpg"),
                      ListItem(3, "Love earth", "Love Earth No Foam Face Wash for Normal to Sensitive Skin | Soap Free, Non-Irritating", 319, "assets/img/319.jpg"),
                      ListItem(4, "Muuchstac Sea Breeze", "Muuchstac Sea Breeze Face Wash with Silicone Brush - SLS and Paraben Free - 100ML - Pack of 1", 375, "assets/img/375.jpg"),
                      ListItem(5, "WOW face wash", "WOW Skin Science Apple Cider Vinegar Foaming Face Wash - with Organic Certified", 294, "assets/img/294.jpg"),
                      ListItem(6, "WOW face wash", "WOW Skin Science Apple Cider Vinegar Face Wash - No Parabens, Sulphate", 275, "assets/img/275.jpg"),
                      ListItem(7, "Himalaya face wash", "Himalaya Purifying Neem Face Wash, 400 ml", 244, "assets/img/244.jpg"),
                      ListItem(8, "Garnier Men", "Garnier Men, Face Wash, Brightening & Anti-Pollution, TurboBright Double Action", 241, "assets/img/241.jpg"),
                      ListItem(9, "Mamaearth face wash", "Mamaearth Vitamin C Face Wash with Vitamin C and Turmeric for Skin Illumination", 224, "assets/img/224.jpg"),
                      ListItem(10, "Beardo Activated Charcoal", "Beardo Activated Charcoal Anti-Pollution Face Wash for Deep Pore Cleaning, 100ml", 206, "assets/img/206.jpg"),
                      ListItem(11, "NIVEA Men Face Wash", "NIVEA Men Face Wash, Dark Spot Reduction, for Clean & Clear Skin with 10x Vitamin ", 146, "assets/img/146.jpg"),
                    ],
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ListItem(int id, String title, String desc, int price, String imageAsset) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(itemModel: ItemModel(
          id, price, title, desc, imageAsset
        )))),
        child: Ink(
          padding: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Hero(
                tag: Key(id.toString()),
                child: Image.asset(
                  imageAsset,
                  width: 70,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                title,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "₹$price",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
