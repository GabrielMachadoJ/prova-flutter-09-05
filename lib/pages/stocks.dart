import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  Map financeData = {};
  String iboPoints = '';
  String iboVariation = '';
  String nasPoints = '';
  String nasVariation = '';
  String cacPoints = '';
  String cacVariation = '';
  String ifixPoints = '';
  String ifixVariation = '';
  String dowPoints = '';
  String dowVariation = '';
  String nikPoints = '';
  String nikVariation = '';

  getData(BuildContext context) async {
    financeData = ModalRoute.of(context)!.settings.arguments as Map;
  }

  _formatData() {
    setState(() {
      iboPoints = double.parse('${financeData['stocks']['IBOVESPA']['points']}')
          .toStringAsFixed(2);
      iboVariation =
          double.parse('${financeData['stocks']['IBOVESPA']['variation']}')
              .toStringAsFixed(2);
      nasPoints = double.parse('${financeData['stocks']['NASDAQ']['points']}')
          .toStringAsFixed(2);
      nasVariation =
          double.parse('${financeData['stocks']['NASDAQ']['variation']}')
              .toStringAsFixed(2);
      cacPoints = double.parse('${financeData['stocks']['CAC']['points']}')
          .toStringAsFixed(2);
      cacVariation =
          double.parse('${financeData['stocks']['CAC']['variation']}')
              .toStringAsFixed(2);
      ifixPoints = double.parse('${financeData['stocks']['IFIX']['points']}')
          .toStringAsFixed(2);
      ifixVariation =
          double.parse('${financeData['stocks']['IFIX']['variation']}')
              .toStringAsFixed(2);
      dowPoints = double.parse('${financeData['stocks']['DOWJONES']['points']}')
          .toStringAsFixed(2);
      dowVariation =
          double.parse('${financeData['stocks']['DOWJONES']['variation']}')
              .toStringAsFixed(2);
      nikPoints = double.parse('${financeData['stocks']['NIKKEI']['points']}')
          .toStringAsFixed(2);
      nikVariation =
          double.parse('${financeData['stocks']['NIKKEI']['variation']}')
              .toStringAsFixed(2);
    });
  }

  handleNextPage() {
    Navigator.pushNamed(context, '/bitcoin', arguments: financeData);
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    _formatData();
    return Layout(pageTitle: 'Ações', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: 'IBOVESPA',
              firstValue: iboPoints,
              variationValue: iboVariation),
          ContentInfo(
              title: 'NASDAQ',
              firstValue: nasPoints,
              variationValue: nasVariation),
          ContentInfo(
              title: 'CAC',
              firstValue: cacPoints,
              variationValue: cacVariation),
        ],
        rightContent: [
          ContentInfo(
              title: 'IFIX',
              firstValue: ifixPoints,
              variationValue: ifixVariation),
          ContentInfo(
              title: 'DOWJONES',
              firstValue: dowPoints,
              variationValue: dowVariation),
          ContentInfo(
              title: 'NIKKEI',
              firstValue: nikPoints,
              variationValue: nikVariation),
        ],
        buttonTitle: 'Ir para Bitcoin',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
