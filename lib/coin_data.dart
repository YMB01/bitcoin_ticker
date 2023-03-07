//2. Import the required packages.
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '0B094369-1FFC-409C-A6BC-310A09BB69EA';

class CoinData {
  final selectedcurrency;
  CoinData(this.selectedcurrency);

  Future getCoinData() async {
    Map<String, dynamic> results = {};
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    for (String cList in cryptoList) {
      //TODO 5: Return a Map of the results instead of a single value.
      String requestURL = '$coinAPIURL/$cList/$selectedcurrency?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(requestURL));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        return results[cList] = lastPrice.toString();
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
  }
}
