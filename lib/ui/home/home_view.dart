import 'package:flutter/material.dart';
import 'package:foodie/constant.dart';
import 'package:foodie/helper.dart';
import 'package:foodie/models/category.dart';
import 'package:foodie/models/food.dart';
import 'package:foodie/ui/home/app_bar.dart';
import 'package:foodie/ui/home/food_view.dart';
import 'package:foodie/ui/widgets/category_tile.dart';
import 'package:foodie/ui/widgets/featured_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = Helper.getCategoryList();
  List<Food> _foodFeaturedList = [];

  @override
  void initState() {
    super.initState();

    _foodFeaturedList.add(
      Food(
        title: "Steak Andakar", 
        image: "assets/images/food_1.jpg", 
        price: 100000,
        description: 'a',
      )
    );
    _foodFeaturedList.add(
        Food(title: "Mie Ayam Tumini", image: "assets/images/food_2.jpg", price: 200000,
        description: 'Fresh and healty salad made with our own Chef Recipe. Special healty and fat-free dish for those who want to lose weight',));
    _foodFeaturedList.add(
        Food(title: "Tengkleng Hohah", image: "assets/images/food_3.jpg", price: 43000,
        description: 'a',));
    _foodFeaturedList.add(
        Food(title: "Warung Steak", image: "assets/images/food_4.jpg", price: 30000,
        description: 'a',));
    _foodFeaturedList.add(Food(
      title: "Kindai Warung Banjar", image: "assets/images/food_5.jpg", price: 3000,
        description: 'a',));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  _buildPaymentMenu(),
                  _buildGreeting(),
                  _buildCategoryMenu(MediaQuery.of(context)),
                  _buildFoodFeatured(),
                  _buildFoodFeatured(),
                ]
              )
            )
          ],
        )
      ),
    );
  }

  Widget _buildPaymentMenu() {
    return Container(
      margin: EdgeInsets.fromLTRB(AppSize.baseSpace, AppSize.baseSpace, AppSize.baseSpace, 20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(AppSize.baseSpace),
            decoration: BoxDecoration(
              color: AppPalette.green.withGreen(160),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "MY WALLET",
                  style: TextStyle(color: Colors.white, fontFamily: "InterBold"),
                ),
                Text(
                  "IDR 120.000",
                  style: TextStyle(color: Colors.white, fontFamily: "InterBold"),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppPalette.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
              )
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.swap_calls_outlined, color: Colors.white, size: 30),
                    SizedBox(height: 10),
                    Text("SEND", style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.qr_code_outlined, color: Colors.white, size: 30),
                    SizedBox(height: 10),
                    Text("SCAN QR", style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.account_balance_wallet_outlined, color: Colors.white, size: 30),
                    SizedBox(height: 10),
                    Text("TOP UP", style: TextStyle(color: Colors.white, fontSize: 12))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.post_add_outlined, color: Colors.white, size: 30),
                    SizedBox(height: 10),
                    Text("MORE", style: TextStyle(color: Colors.white, fontSize: 12.0))
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }

  Widget _buildGreeting() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSize.baseSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hi, ', style: TextStyle(fontSize: 16)),
              Text('Angga Ari Wijaya', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5),
          Text('Start your day with a healty meal!', style: TextStyle(color: AppPalette.darkGrey))
        ]
      ),
    );
  }

  Widget _buildCategoryMenu(MediaQueryData mediaQuery) {
    const int totalFeaturedCategory = 8;
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: totalFeaturedCategory,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          if (index == totalFeaturedCategory - 1) {
            return CategoryTile(
              Category(
                category: 'More', 
                icon: 'assets/icons/category-ingredients.png'
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                    ),
                  ),
                  builder: (_) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      maxChildSize: 1,
                      minChildSize: 0.75,
                      builder: (BuildContext context, ScrollController scrollController) {
                        return Container(
                          margin: EdgeInsets.only(top: mediaQuery.padding.top + 350),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )
                          ),
                          child: _buildMenuBottomSheet(scrollController, mediaQuery)
                        );
                      }
                    );
                  }
                );
              },
            );
          } else {
            return CategoryTile(categories[index]);
          }
        }
      )
    );
  }

  Widget _buildFoodFeatured() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.baseSpace),
            child: Text("Nearby", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.baseSpace),
            child: Text("Food around you"),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: _foodFeaturedList.length,
              padding: EdgeInsets.only(top: 15, left: AppSize.baseSpace),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FeaturedTile(_foodFeaturedList[index], onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(_foodFeaturedList[index])));
                });
              },
            ), 
          )
        ],
      ),
    );
  }

  Widget _buildMenuBottomSheet(ScrollController scrollController, MediaQueryData mediaQuery) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Container(
        padding: EdgeInsets.only(left: AppSize.baseSpace, right: AppSize.baseSpace),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.drag_handle,
              color: AppPalette.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Foodie Category",
                  style: TextStyle(fontFamily: "InterBold", fontSize: 18),
                ),
                OutlineButton(
                  color: AppPalette.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text(
                    "EDIT FAVORITES",
                    style: TextStyle(fontSize: 12, color: AppPalette.green),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                controller: scrollController,
                physics: ClampingScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return CategoryTile(categories[index]);
                }
              ),
            ),
          ]
        ),
      );
    });
  }
}