import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 1,
            color: Colors.white,
            iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1))),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2560px-Instagram_logo.svg.png",
            height: 50,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(8, (index) => storyCircle(index)),
              ),
            ),
            const Divider(),
            Column(
              children: List.generate(
                8,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Instagram_Stories_ring.svg/1024px-Instagram_Stories_ring.svg.png"),
                            radius: 14,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://cdn.britannica.com/05/236505-050-17B6E34A/Elon-Musk-2022.jpg"),
                              radius: 12,
                            ),
                          ),
                        ),
                        const Text("profile name"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                    Image.network(
                        "https://entrackr.com/storage/2022/10/Spacex.jpg"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chat_bubble_outline)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.send)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border))
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: "Liked by"),
                                TextSpan(
                                    text: " Profile Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: " and"),
                                TextSpan(
                                    text: " others",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Profile Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        " This is the most amazing picture ever put on Instagram. This is also the best course ver made !")
                              ],
                            ),
                          ),
                          const Text(
                            "View all 12 comments",
                            style: TextStyle(color: Colors.black38),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          children: [
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home,
                    color: Color.fromRGBO(40, 40, 40, 1))),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search,
                    color: Color.fromRGBO(40, 40, 40, 1))),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_a_photo_outlined,
                    color: Color.fromRGBO(40, 40, 40, 1))),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.playlist_play,
                    color: Color.fromRGBO(40, 40, 40, 1))),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn.britannica.com/05/236505-050-17B6E34A/Elon-Musk-2022.jpg"),
                radius: 12,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

Container storyCircle(int index) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Instagram_Stories_ring.svg/1024px-Instagram_Stories_ring.svg.png"),
          radius: 35,
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
                "https://cdn.britannica.com/05/236505-050-17B6E34A/Elon-Musk-2022.jpg"),
            radius: 32,
            child: (index == 0)
                ? const Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12.0,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 0, 120, 201),
                        radius: 8.0,
                        child: Icon(
                          Icons.add,
                          size: 12.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Profile Name",
          style: TextStyle(fontSize: 12, color: Colors.black87),
        )
      ],
    ),
  );
}
