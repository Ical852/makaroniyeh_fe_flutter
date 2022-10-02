import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makaroniyeh/models/categorymodel.dart';
import 'package:makaroniyeh/models/productmodel.dart';
import 'package:makaroniyeh/services/service.dart';
import 'package:makaroniyeh/shared/theme.dart';
import 'package:makaroniyeh/widgets/bestselleritem.dart';
import 'package:makaroniyeh/widgets/navitem.dart';
import 'package:makaroniyeh/widgets/newcatitem.dart';
import 'package:makaroniyeh/widgets/newitem.dart';
import 'package:makaroniyeh/widgets/popularitem.dart';
import 'package:makaroniyeh/widgets/superitem.dart';
import 'package:makaroniyeh/widgets/titlecustomed.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getCategories();
    getBestSeller();
    getSpecial();
    getPopular();
    getAllProduct();
  }

  List<CategoryModel> categories = [];
  List<ProductModel> bestSellerProducts = [];
  List<ProductModel> specialProducts = [];
  List<ProductModel> popularProducts = [];
  List<ProductModel> allProducts = [];
  var currentCat = "all";

  void changecat(var cat, int id) {
    this.setState(() {
      if (cat != "all") {
        getProductByCategory(id);
      } else {
        getAllProduct();
      }
      currentCat = cat;
    });
  }

  void getCategories() async {
    List<CategoryModel> apicategories = await AllService().getCategories();
    this.setState(() {
      categories = apicategories;
    });
  }

  void getBestSeller() async {
    List<ProductModel> apiBestSeller = await AllService().getBestSeller();
    this.setState(() {
      bestSellerProducts = apiBestSeller;
    });
  }

  void getSpecial() async {
    List<ProductModel> apiSpecial = await AllService().getSpecial();
    this.setState(() {
      specialProducts = apiSpecial;
    });
  }

  void getPopular() async {
    List<ProductModel> apiPopular = await AllService().getPopular();
    this.setState(() {
      popularProducts = apiPopular;
    });
  }

  void getAllProduct() async {
    List<ProductModel> apiAllProduct = await AllService().getAllProducts();
    this.setState(() {
      allProducts = apiAllProduct;
    });
  }

  void getProductByCategory(int id) async {
    List<ProductModel> productByCat = await AllService().getProductsByCategory(id);
    this.setState(() {
      allProducts = productByCat;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget searchInput() {
      return Container(
        height: 45,
        margin: EdgeInsets.only(
          top: 12
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            Container(
              margin : EdgeInsets.symmetric(
                horizontal: 12
              ),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icsearch.png")
                )
              ),
            ),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: "Search your makaroni here",
                  hintStyle: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: reguler
                  )
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget headerProfile() {
      return Row(
        children: [
          Container(
            width: 157,
            child: Text(
              "Hello, Shalahuddin",
              style: poppinsText.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
                color: white
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/dummy/profile.png")
              )
            ),
          )
        ],
      );
    }

    Widget header() {
      return Container(
        height: 194,
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        child: Column(
          children: [
            headerProfile(),
            searchInput()
          ],
        ),
      );
    }

    Widget apiBestSeller() {
      return bestSellerProducts.length > 0 ?
        Row(
          children: bestSellerProducts.map((bsProduct) => BestSellerItem(
            image: "$imageUrl/${bsProduct.image}", 
            cat: bsProduct.category.name, 
            title: bsProduct.name, 
            price: bsProduct.price
          )).toList(),
        )
        : Center(
          child: CircularProgressIndicator(),
        );
    }

    Widget bestSeller() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24,),
              apiBestSeller()
            ],
          ),
        ),
      );
    }

    Widget superSpesial() {
      return Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 9
        ),
        height: 280,
        child: GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 156 / 107,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
          children: specialProducts.map((special) => SuperItem(
            image: "$imageUrl/${special.image}", 
            cat: special.category.name, 
            title: special.name, 
            price: special.price
          )).toList(),
        ),
      );
    }

    Widget popularApi() {
      return popularProducts.length > 0 ?
        Row(
          children: popularProducts.map((popular) => PopularItem(
            cat: popular.category.name, 
            image: "$imageUrl/${popular.image}", 
            title: popular.name, 
            price: popular.price
          )).toList(),
        )
        : Center(child: CircularProgressIndicator(),); 
    }

    Widget popular() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24,),
              popularApi(),
              SizedBox(width: 4,)
            ],
          ),
        ),
      );
    }

    Widget apiCategories() {
      return categories.length > 0 ? 
        Row(
          children: categories.map((category) => NewCatItem(
            title: category.name, 
            onPress: () {
              changecat(category.name, category.id);
            },
            active: currentCat == category.name,
          )).toList()
        )
        : Center(child: CircularProgressIndicator());
    }

    Widget category() {
      return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24,),
              NewCatItem(
                title: "All Makaroni", 
                onPress: (){
                  changecat("all", 99);
                },
                active: currentCat == "all",
              ),
              apiCategories(),
              SizedBox(width: 8,)
            ],
          ),
        ),
      );
    }

    Widget newItem() {
      return allProducts.length > 0 ? Container(
        margin: EdgeInsets.only(
          top: 16
        ),
        child: Column(
          children: allProducts.map((product) => NewItem(
            image: "$imageUrl/${product.image}", 
            cat: product.category.name, 
            title: product.name, 
            desc: product.desc, 
            price: product.price
          )).toList(),
        ),
      ) : Center(child: CircularProgressIndicator(),);
    }

    Widget content() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(height: 46,),
            TitleCustomed(
              title: "Best Seller Makaroni",
              subtitle: "Get best seller makaroni right now !",
            ),
            bestSeller(),
            TitleCustomed(
              title: "Super Special Makaroni",
              subtitle: "Get super special makaroni now before it’s too late !",
            ),
            superSpesial(),
            SizedBox(height: 20,),
            TitleCustomed(
              title: "Popular Makaroni",
              subtitle: "Get popular makaroni right now !",
            ),
            popular(),
            category(),
            SizedBox(height: 16,),
            TitleCustomed(
              title: "New Makaroni",
              subtitle: "Get new makaroni right now !",
            ),
            newItem(),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 20
                ),
                child: Text(
                  "Show all makaroni >>",
                  style: poppinsText.copyWith(
                    fontSize: 10,
                    fontWeight: medium,
                    color: primaryColor
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),
      );
    }

    Widget payContent() {
      return Container(
        padding: EdgeInsets.only(
          left: 18,
          right: 24
        ),
        margin: EdgeInsets.only(
          top: 165,
          left: 24,
          right: 24
        ),
        height: 60,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icscan.png")
                )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 18
              ),
              width: 1,
              height: 34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icline.png")
                )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IDR. 50.000",
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: primaryColor
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    "Your makaroniPay Right Now",
                    style: poppinsText.copyWith(
                      fontSize: 10,
                      fontWeight: reguler,
                      color: grey
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icplus.png")
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget bottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 71,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black,
                blurRadius: 5,
                offset: Offset(0, 5))
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                text: "Home",
                image: "home",
                active: true,
              ),
              NavItem(
                text: "Explore",
                image: "explore",
              ),
              NavItem(
                text: "Wishs",
                image: "love",
              ),
              NavItem(
                text: "Profile",
                image: "profile",
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  content(),
                  payContent()
                ],
              ),
            ),
            bottomNav()
          ],
        ),
      ),
    );
  }
}