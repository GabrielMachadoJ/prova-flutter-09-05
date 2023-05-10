import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  Map financeData = {};
  String blockBuy = '';
  String blockVariation = '';
  String coinbaseBuy = '';
  String coinbaseVariation = '';
  String bitstampBuy = '';
  String bitstampVariation = '';
  String foxbitBuy = '';
  String foxbitVariation = '';
  String mercadobitcoinBuy = '';
  String mercadobitcoinVariation = '';

  getData(BuildContext context) async {
    financeData = ModalRoute.of(context)!.settings.arguments as Map;
  }

  _formatData() {
    setState(() {
      blockBuy =
          double.parse('${financeData['bitcoin']['blockchain_info']['buy']}')
              .toStringAsFixed(2);
      blockVariation = double.parse(
              '${financeData['bitcoin']['blockchain_info']['variation']}')
          .toStringAsFixed(3);
      coinbaseBuy = double.parse('${financeData['bitcoin']['coinbase']['buy']}')
          .toStringAsFixed(2);
      coinbaseVariation =
          double.parse('${financeData['bitcoin']['coinbase']['variation']}')
              .toStringAsFixed(3);
      bitstampBuy = double.parse('${financeData['bitcoin']['bitstamp']['buy']}')
          .toStringAsFixed(2);
      bitstampVariation =
          double.parse('${financeData['bitcoin']['bitstamp']['variation']}')
              .toStringAsFixed(3);
      foxbitBuy = double.parse('${financeData['bitcoin']['foxbit']['buy']}')
          .toStringAsFixed(2);
      foxbitVariation =
          double.parse('${financeData['bitcoin']['foxbit']['variation']}')
              .toStringAsFixed(3);
      mercadobitcoinBuy =
          double.parse('${financeData['bitcoin']['mercadobitcoin']['buy']}')
              .toStringAsFixed(2);
      mercadobitcoinVariation = double.parse(
              '${financeData['bitcoin']['mercadobitcoin']['variation']}')
          .toStringAsFixed(3);
    });
  }

  handleNextPage() {
    Navigator.pushReplacementNamed(context, '/currencies');
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    _formatData();
    return Layout(pageTitle: 'BitCoin', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: 'Blockchain.info',
              firstValue: blockBuy,
              variationValue: blockVariation),
          ContentInfo(
              title: 'BitStamp',
              firstValue: bitstampBuy,
              variationValue: bitstampVariation),
          ContentInfo(
              title: 'Mercado Bitcoin',
              firstValue: mercadobitcoinBuy,
              variationValue: mercadobitcoinVariation),
        ],
        rightContent: [
          ContentInfo(
              title: 'Coinbase',
              firstValue: coinbaseBuy,
              variationValue: coinbaseVariation),
          ContentInfo(
              title: 'FoxBit',
              firstValue: foxbitBuy,
              variationValue: foxbitVariation),
        ],
        buttonTitle: 'Página Principal',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
