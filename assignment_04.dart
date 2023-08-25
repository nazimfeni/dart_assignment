/* Assignment no 04
Batch: Flutter-04
Name: Md. Nazim Uddin
*/

abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  deposit(double amount) {
    this.balance += amount;
    print(
        'Deposited in acc number ${this.accountNumber} is: ${amount.toStringAsFixed(2)}');
  }

  withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
      print(
          'Withdrawn form ${this.accountNumber} is: ${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  withdraw(double amount) {
    if (amount <= this.balance + this.overdraftLimit) {
      this.balance -= amount;
      print(
          'Withdrawn form ${this.accountNumber} is: ${amount.toStringAsFixed(2)}');
    } else {
      print('insufficient funds');
    }
  }
}

void main() {
  SavingsAccount savingsAccount = SavingsAccount(123, 1000.0, 0.05);
  savingsAccount.deposit(4000.0);
  savingsAccount.withdraw(3000.0);
  print("");

  CurrentAccount currentAccount = CurrentAccount(456, 1000.0, 1000.0);
  currentAccount.deposit(1000.0);
  currentAccount.withdraw(3500.0);
}
