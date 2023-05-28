import 'dart:io';

main() {
  void purchaseProduct(product) {
    double orderPrice = product['price'];
    print('Davam etmək istəyirsinizmi? (yes/no)');
    String continue_ = stdin.readLineSync().toString();

    if (continue_ == 'yes') {
      print(
          '${product["name"]} ${product["model"]} məhsulunu naqd yoxsa kartla almaq istəyirsiniz?');
      String purchaseType = stdin.readLineSync().toString();
      switch (purchaseType) {
        case 'naqd':
          print('catdirilma (+10 azn) yoxsa ozun apar');
          String deliveryType = stdin.readLineSync().toString();
          if (deliveryType == 'catdirilma') {
            orderPrice += 10;
            print(
                '${product["name"]} ${product["model"]} modelini ${orderPrice} AZN-a sifarish verdiniz');
          } else if (deliveryType == 'ozun apar') {
            print(
                '${product["name"]} ${product["model"]} modelini ${orderPrice} AZN-a sifarish verdiniz');
          }
          break;
        case 'kart':
          print('birbaşa yoxsa taksit?');
          String cardPurchaseType = stdin.readLineSync().toString();
          if (cardPurchaseType == 'birbasha') {
            print('kart məlumatlarınızı daxil edin zəhmət olmasa');
            String cardInfo = stdin.readLineSync().toString();
          } else if (cardPurchaseType == 'taksit') {
            print(
                'Birkart ilə 3, 6 ,12 , 18 və 24 aylıq ödəniş mümkündür və qiymət stabil qalır.');
            print(
                'Tamkart ilə 3, 6 və 12 ayllq ödəniş var. 12 aylıq seçildikdə  məhsulun qiymətinin üzərinə 25% əlavə olunur.');
            print(
                'Bolkart ilə  3 və 6 aylıq ödəniş var.  6 aylıq seçildikdə hər ay üçün 10 azn əlavə olunur.');

            print('Kart tipini seçin');

            String cardName = stdin.readLineSync().toString();

            switch (cardName) {
              case "Birkart":
                print('Birkart üzrə ödəniş müddətini seçin: ');
                int month = int.parse(stdin.readLineSync().toString());
                while (month != 3 &&
                    month != 6 &&
                    month != 12 &&
                    month != 18 &&
                    month != 24) {
                  print("uyğun ay seçin");
                  month = int.parse(stdin.readLineSync().toString());
                }

                print(
                    'Siz ${product["name"]} ${product["model"]} modelini ${month} ayla ${orderPrice} AZN-a aldiniz');
                break;
              case "Tamkart":
                print('Tamkart üzrə ödəniş müddətini seçin: ');
                int month = int.parse(stdin.readLineSync().toString());
                while (month != 3 && month != 6 && month != 12) {
                  print("uyğun ay seçin");
                  month = int.parse(stdin.readLineSync().toString());
                }
                orderPrice += (month == 12) ? orderPrice * 0.25 : orderPrice;

                print(
                    'Siz ${product["name"]} ${product["model"]} modelini ${month} ayla ${orderPrice} AZN-a aldiniz');
                break;
              case "Bolkart":
                print('Bolkart üzrə ödəniş müddətini seçin: ');
                int month = int.parse(stdin.readLineSync().toString());
                while (month != 3 && month != 6) {
                  print("uyğun ay seçin");
                  month = int.parse(stdin.readLineSync().toString());
                }
                orderPrice += (month == 6) ? orderPrice + 60 : orderPrice;

                print(
                    'Siz ${product["name"]} ${product["model"]} modelini ${month} ayla ${orderPrice} AZN-a aldiniz');
                break;
              default:
            }
          }
          break;
        default:
      }
    } else {
      print('Bye-Bye');
    }
  }

  void showProduct(name) {
    int productInd;

    List<Map> product = [
      {'name': 'Iphone', 'model': '13', 'storage': '128gb', 'price': 1849.99},
      {
        'name': 'Samsung',
        'model': 'Galaxy S23 Ultra',
        'storage': '256gb',
        'price': 2979.99
      },
      {
        'name': 'Google',
        'model': 'Pixel 6 Pro',
        'storage': '128gb',
        'price': 2349.99
      },
      {
        'name': 'Xiaomi',
        'model': 'Redmi Note 12',
        'storage': '128gb',
        'price': 449.99
      },
      {
        'name': 'Iphone',
        'model': '14 Pro',
        'storage': '512gb',
        'price': 3699.99
      }
    ];
    print('${name}, məhsulları qarşısındakı indexlə seçə bilərsiz \n');
    print('0: ' + product[0]['name'] + ' ' + product[0]['model']);
    print('1: ' + product[1]['name'] + ' ' + product[1]['model']);
    print('2: ' + product[2]['name'] + ' ' + product[2]['model']);
    print('3: ' + product[3]['name'] + ' ' + product[3]['model']);
    print('4: ' + product[4]['name'] + ' ' + product[4]['model']);

    print("Seçdiyiniz məhsulun index:");
    productInd = int.parse(stdin.readLineSync().toString());
    print('Məhsula detallı baxış: ' +
        product[productInd]['name'] +
        ' ' +
        product[productInd]['model'] +
        ' ' +
        product[productInd]['storage'] +
        ' ' +
        product[productInd]['price'].toString() +
        ' AZN');

    purchaseProduct(product[productInd]);
  }

  void login() {
    print('Giriş növünü təyin edin (login/guest): ');
    String loginType = stdin.readLineSync().toString();

    String name = '';
    String pass = '';

    switch (loginType) {
      case "login":
        while (true) {
          print('ad daxil edin');
          name = stdin.readLineSync().toString();
          print('pass daxil edin');
          pass = stdin.readLineSync().toString();

          if ((name != '' && pass != '') || (name != ' ' && pass != ' ')) {
            break;
          }
          ;
          print('heçbir inputu boş saxlamaq olmaz');
        }
        showProduct(name);
        break;
      case "guest":
        print('Siz Guest kimi davam edirsiniz');
        name = 'Guest';
        pass = 'GuestPass';
        showProduct(name);
        break;
      default:
        print('login və guest kimi davam edə bilərsiniz, yenidən seçim edin!');
        login();
        break;
    }
  }

  login();
}
