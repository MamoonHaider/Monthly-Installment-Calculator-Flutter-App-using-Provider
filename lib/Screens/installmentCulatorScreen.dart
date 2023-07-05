import 'package:flutter/material.dart';
import 'package:installment_calculator/AppThemeColors/appColors.dart';
import 'package:installment_calculator/Providers/installmentScreenProvider.dart';
import 'package:provider/provider.dart';

class InstallmentCalCulatorScreen extends StatefulWidget {
  const InstallmentCalCulatorScreen({super.key});

  @override
  State<InstallmentCalCulatorScreen> createState() =>
      _InstallmentCalCulatorScreenState();
}

class _InstallmentCalCulatorScreenState
    extends State<InstallmentCalCulatorScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<InstallmentScreenPovider>(context, listen: false);
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: secondaryBackgroundColor,
        title: const Center(
          child: Text(
            'Monthly Installment Calculator App',
            style: TextStyle(color: mainTextColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 35.0),
            child: Text('Welcome!',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: mainTextColor)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Loan Amount          :',
                style: TextStyle(color: mainTextColor)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: boxesBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: secondaryBackgroundColor,
                ),
                width: 80,
                height: 35,
                child: TextField(
                  controller: provider.loanAmountController,
                  onChanged: (newLoanAmount) {
                    provider.setLoanAmountController(newLoanAmount);
                  },
                  style: const TextStyle(color: mainTextColor, fontSize: 12),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle:
                        const TextStyle(color: mainTextColor, fontSize: 12),
                    hintText: "00.00",
                  ),
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Number of Months :',
                style: TextStyle(color: mainTextColor)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: boxesBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: secondaryBackgroundColor,
                ),
                width: 80,
                height: 35,
                child: TextField(
                  controller: provider.noOfMonthsController,
                  onChanged: (newNoOfMonths) {
                    provider.setNoOfMonthsController(newNoOfMonths);
                    // print(provider.loanAmountController.text);
                  },
                  style: const TextStyle(color: mainTextColor, fontSize: 12),
                  // controller: emailController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle:
                        const TextStyle(color: mainTextColor, fontSize: 12),
                    hintText: "00",
                  ),
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Interest Rate            :',
                style: TextStyle(color: mainTextColor)),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: boxesBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: secondaryBackgroundColor,
                ),
                width: 80,
                height: 35,
                child: TextField(
                  controller: provider.interestRateController,
                  onChanged: (newInterestRate) {
                    provider.setInterestRateController(newInterestRate);
                  },
                  style: const TextStyle(color: mainTextColor, fontSize: 12),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle:
                        const TextStyle(color: mainTextColor, fontSize: 12),
                    hintText: "1-100",
                  ),
                ),
              ),
            ),
          ]),
          Consumer<InstallmentScreenPovider>(
            builder: (context, proValue, child) =>
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Installment per Month       :',
                  style: TextStyle(color: mainTextColor)),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10, right: 10, bottom: 10),
                  child: Text('₱ ${proValue.monthlyPayment.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: mainTextColor, fontWeight: FontWeight.bold))),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 10),
              child: SizedBox(
                width: 215,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainButtonsColor),
                  onPressed: () {
                    provider.setData();
                    provider.computeInstallment();
                  },
                  child: const Text(
                    'Calculate Monthly Installment',
                    style: TextStyle(fontSize: 13, color: buttonsTextColors),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
