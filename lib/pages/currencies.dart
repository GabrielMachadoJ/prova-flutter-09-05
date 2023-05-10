import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';
import 'package:http/http.dart';

class Currencies extends StatefulWidget {
  const Currencies({super.key});

  @override
  State<Currencies> createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
  Map financeData = {};
  String dolarBuy = '';
  String dolarVariation = '';
  String euroBuy = '';
  String euroVariation = '';
  String pesoBuy = '';
  String pesoVariation = '';
  String yenBuy = '';
  String yenVariation = '';

  @override
  void initState() {
    super.initState();
    getFinanceData();
  }

  _formatMoney() {
    setState(() {
      dolarBuy = double.parse(financeData['currencies']['dolar']['buy'])
          .toStringAsFixed(4);
      dolarVariation =
          double.parse(financeData['currencies']['dolar']['variation'])
              .toStringAsFixed(4);
      euroBuy = double.parse(financeData['currencies']['euro']['buy'])
          .toStringAsFixed(4);
      euroVariation =
          double.parse(financeData['currencies']['euro']['variation'])
              .toStringAsFixed(4);
      pesoBuy = double.parse(financeData['currencies']['peso']['buy'])
          .toStringAsFixed(4);
      pesoVariation =
          double.parse(financeData['currencies']['peso']['variation'])
              .toStringAsFixed(4);
      yenBuy = double.parse(financeData['currencies']['yen']['buy'])
          .toStringAsFixed(4);
      yenVariation = double.parse(financeData['currencies']['yen']['variation'])
          .toStringAsFixed(4);
    });
  }

  getFinanceData() async {
    const String url =
        'https://api.hgbrasil.com/finance?key=2c720572&format=json-cors';
    try {
      Response resposta = await get(Uri.parse(url));
      Map resp = json.decode(resposta.body);
      setState(() {
        financeData = {
          'currencies': {
            'dolar': {
              'buy': '${resp['results']['currencies']['USD']['buy']}',
              'variation':
                  '${resp['results']['currencies']['USD']['variation']}'
            },
            'euro': {
              'buy': '${resp['results']['currencies']['EUR']['buy']}',
              'variation':
                  '${resp['results']['currencies']['EUR']['variation']}'
            },
            'peso': {
              'buy': '${resp['results']['currencies']['ARS']['buy']}',
              'variation':
                  '${resp['results']['currencies']['ARS']['variation']}'
            },
            'yen': {
              'buy': '${resp['results']['currencies']['JPY']['buy']}',
              'variation':
                  '${resp['results']['currencies']['JPY']['variation']}'
            }
          },
          'stocks': {
            'IBOVESPA': {
              'points': '${resp['results']['stocks']['IBOVESPA']['points']}',
              'variation':
                  '${resp['results']['stocks']['IBOVESPA']['variation']}'
            },
            'NASDAQ': {
              'points': '${resp['results']['stocks']['NASDAQ']['points']}',
              'variation': '${resp['results']['stocks']['NASDAQ']['variation']}'
            },
            'CAC': {
              'points': '${resp['results']['stocks']['CAC']['points']}',
              'variation': '${resp['results']['stocks']['CAC']['variation']}'
            },
            'IFIX': {
              'points': '${resp['results']['stocks']['IFIX']['points']}',
              'variation': '${resp['results']['stocks']['IFIX']['variation']}'
            },
            'DOWJONES': {
              'points': '${resp['results']['stocks']['DOWJONES']['points']}',
              'variation':
                  '${resp['results']['stocks']['DOWJONES']['variation']}'
            },
            'NIKKEI': {
              'points': '${resp['results']['stocks']['NIKKEI']['points']}',
              'variation': '${resp['results']['stocks']['NIKKEI']['variation']}'
            },
          },
          'bitcoin': {
            'blockchain_info': {
              'buy': '${resp['results']['bitcoin']['blockchain_info']['buy']}',
              'variation':
                  '${resp['results']['bitcoin']['blockchain_info']['variation']}'
            },
            'coinbase': {
              'buy': '${resp['results']['bitcoin']['coinbase']['last']}',
              'variation':
                  '${resp['results']['bitcoin']['coinbase']['variation']}'
            },
            'bitstamp': {
              'buy': '${resp['results']['bitcoin']['bitstamp']['buy']}',
              'variation':
                  '${resp['results']['bitcoin']['bitstamp']['variation']}'
            },
            'foxbit': {
              'buy': '${resp['results']['bitcoin']['foxbit']['last']}',
              'variation':
                  '${resp['results']['bitcoin']['foxbit']['variation']}'
            },
            'mercadobitcoin': {
              'buy': '${resp['results']['bitcoin']['mercadobitcoin']['buy']}',
              'variation':
                  '${resp['results']['bitcoin']['mercadobitcoin']['variation']}'
            },
          },
        };
      });
      _formatMoney();
    } catch (e) {
      print('Error: $e');
    }
  }

  handleNextPage() {
    Navigator.pushNamed(context, '/stocks', arguments: financeData);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(pageTitle: 'MOEDAS', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: 'Dólar',
              firstValue: dolarBuy,
              variationValue: dolarVariation),
          ContentInfo(
              title: 'Peso',
              firstValue: pesoBuy,
              variationValue: pesoVariation),
        ],
        rightContent: [
          ContentInfo(
              title: 'Euro',
              firstValue: euroBuy,
              variationValue: euroVariation),
          ContentInfo(
              title: 'Yen', firstValue: yenBuy, variationValue: yenVariation),
        ],
        buttonTitle: 'Ir para Ações',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
