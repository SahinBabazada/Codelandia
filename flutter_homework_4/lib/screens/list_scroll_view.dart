import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ListScrollWidget extends StatelessWidget {
  const ListScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> indexList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FeatherIcons.navigation,
              color: Color.fromRGBO(0, 157, 224, 1)),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromRGBO(0, 157, 224, 0.08))),
          onPressed: () {},
        ),
        title: const Text(
          "Your current location >",
          style: TextStyle(color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13),
        ),
      ),
      body: ListView.builder(
        itemCount: indexList.length,
        itemBuilder: (context, index) {
          debugPrint(index.toString());
          return containerMethod(Colors.lightBlue, indexList[index]);
        },
      ),
    );
  }
}

Padding containerMethod(Color color, int value) {
  Padding result;

  switch (value) {
    case 0:
      result = categories();
      break;
    case 1:
      result = carousel();
      break;
    case 2:
      result = scrollContainer("0 AZN delivery fee with Wolt+");
      break;
    default:
      result = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          width: 377,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Center(
            child: Text(
              '$value',
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ),
      );
  }
  return result;
}

Padding carousel() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      // reverse: true,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: Image(
                width: 377,
                height: 300,
                image: NetworkImage(
                    "https://images.ctfassets.net/et5i6t44yqqw/XPfGoWbzQRyDkOwx7SlwO/ccf27d9f051b9a255a1c6b8caaff0738/tech_blog_post_16x9__1_.png")),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Image(
                width: 377,
                height: 300,
                image: NetworkImage(
                    "https://static.wixstatic.com/media/515b5a_e6c8ab1cc8ab45aa84ef0e41e6554e71~mv2.png/v1/fill/w_743,h_416,al_c,lg_1,q_85/515b5a_e6c8ab1cc8ab45aa84ef0e41e6554e71~mv2.png")),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Image(
                width: 377,
                height: 300,
                image: NetworkImage(
                    "https://i.ytimg.com/vi/PrhFc9z6Gvw/maxresdefault.jpg")),
          ),
        ],
      ),
    ),
  );
}

Padding scrollContainer(String name) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(name),
          TextButton(
              onPressed: () => {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: Color.fromRGBO(0, 157, 224, 0.08)))),
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(0, 157, 224, 0.08))),
              child: const Text("see all", style: TextStyle(color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13),))
        ]),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Image(
                    width: 207,
                    height: 240,
                    image: NetworkImage(
                        "https://images.ctfassets.net/et5i6t44yqqw/XPfGoWbzQRyDkOwx7SlwO/ccf27d9f051b9a255a1c6b8caaff0738/tech_blog_post_16x9__1_.png")),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Image(
                    width: 207,
                    height: 240,
                    image: NetworkImage(
                        "https://static.wixstatic.com/media/515b5a_e6c8ab1cc8ab45aa84ef0e41e6554e71~mv2.png/v1/fill/w_743,h_416,al_c,lg_1,q_85/515b5a_e6c8ab1cc8ab45aa84ef0e41e6554e71~mv2.png")),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Image(
                    width: 207,
                    height: 240,
                    image: NetworkImage(
                        "https://i.ytimg.com/vi/PrhFc9z6Gvw/maxresdefault.jpg")),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Padding categories() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Expanded(
      flex: 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // physics: const BouncingScrollPhysics(),
        // reverse: true,
        // padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            circleContainer(
                "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                "Restaurants"),
            circleContainer(
                "https://img.freepik.com/premium-vector/food-store-basket-composition_1284-71713.jpg?w=2000",
                "Groceries"),
            circleContainer(
                "https://previews.123rf.com/images/bsd555/bsd5551703/bsd555170300236/74630470-alcohol-drinks-color-icon-wine-bottle-glass-and-foamy-beer-mug-bar-or-pub-sign-isolated-vector.jpg",
                "Alcohol"),
            circleContainer(
                "https://cdn.pixabay.com/photo/2018/03/04/08/58/flower-3197493_1280.png",
                "Flowers"),
            circleContainer(
                "https://cdn3.vectorstock.com/i/1000x1000/35/22/supermarket-grocery-store-icon-isolated-on-white-vector-32003522.jpg",
                "General Stores"),
            circleContainer(
                "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                "Health & Beauty"),
            circleContainer(
                "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                "Pet Supply"),
            circleContainer(
                "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                "Pharmacies"),
            circleContainer(
                "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                "Wolt+"),
          ],
        ),
      ),
    ),
  );
}

Padding circleContainer(String imageUrl, String label) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 26,
            )),
        const SizedBox(
          height: 6,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        )
      ]));
}
