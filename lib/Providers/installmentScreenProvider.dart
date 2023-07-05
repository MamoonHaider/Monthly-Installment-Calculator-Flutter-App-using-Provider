import 'dart:math';

import 'package:flutter/material.dart';

class InstallmentScreenPovider extends ChangeNotifier {
  late TextEditingController loanAmountController = TextEditingController();
  late TextEditingController noOfMonthsController = TextEditingController();
  late TextEditingController interestRateController = TextEditingController();
  double totalLoanAmount = 0;
  double interestRate = 0;
  int noOfMonths = 0;
  double monthlyPayment = 0;
//Setters
  void setLoanAmountController(String loanAmountController1) {
    if (loanAmountController.text != loanAmountController1) {
      loanAmountController.text = loanAmountController1;
      notifyListeners();
    }
  }

  void setNoOfMonthsController(String noOfMonthsController1) {
    if (noOfMonthsController.text != noOfMonthsController1) {
      noOfMonthsController.text = noOfMonthsController1;
      notifyListeners();
    }
  }

  void setInterestRateController(String interestRateController1) {
    if (interestRateController.text != interestRateController1) {
      interestRateController.text = interestRateController1;
      notifyListeners();
    }
  }

//Method to set all values to update  values before calculation funcion is caled
  void setData() {
    totalLoanAmount = double.parse(loanAmountController.text);
    noOfMonths = int.parse(noOfMonthsController.text);
    interestRate = double.parse(interestRateController.text);
    notifyListeners();
  }

//function to calculate the monthly installment
  void computeInstallment() {
    //changing from percentage to decimal form
    interestRate = interestRate / 100;
    //formula to calculate installment/month
    double monthlyInterestRate = interestRate / noOfMonths;
    monthlyPayment = totalLoanAmount *
        (monthlyInterestRate / (1 - pow(1 + monthlyInterestRate, -noOfMonths)));
    notifyListeners();
  }
}
