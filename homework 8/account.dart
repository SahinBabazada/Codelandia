class Account {
  late final int accountNumber;
  late final String accountOwnerName;
  late double accountBalance;

  Account(this.accountNumber, this.accountOwnerName, this.accountBalance);

  void displayAccountDetails() {
    print(
        'Account Number: $accountNumber \nAccount Owner Name: $accountOwnerName \nAccount Balance: $accountBalance₼');
  }
  void increaseAccountBalance(double amount) {
    accountBalance += amount;
    print('Account balance increased $amount. Your balance: $accountBalance₼');
  }
  void decreaseAccountBalance(double amount) {
    if (accountBalance >= amount) {
      accountBalance -= amount;
      print('Account balance decreased $amount. Your balance: $accountBalance₼');
    } else {
      print(
          'Insufficient funds. Cannot withdraw $amount. Current balance: $accountBalance₼');
    }
  }
}
