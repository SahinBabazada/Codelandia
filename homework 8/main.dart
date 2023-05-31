import 'account.dart';

void main(List<String> args) {

  var account = Account(202306001, 'Shahin B', 5000.0);

  account.displayAccountDetails();

  account.increaseAccountBalance(300.0);
  account.decreaseAccountBalance(600.0);
  account.decreaseAccountBalance(1000.0);

  print("-------------------------------");

  var account2 = Account(243532534, 'Account 2 for test', 200.0);

  account2.displayAccountDetails();

  account2.increaseAccountBalance(400.0);
  account2.decreaseAccountBalance(650);
  account2.decreaseAccountBalance(600);
}
