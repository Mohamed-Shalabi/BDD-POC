import 'dart:async';
import 'package:bdd_framework/bdd_framework.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bdd_poc/best_time_to_buy_and_sell_stock_ii.dart' as p;

void main() {
  final feature = BddFeature('Best Time To Buy And Sell Stock II');
  Bdd(feature)
      .scenario('Buying and Selling Stocks')
      .given('The prices per day are <Prices>')
      .and('<Prices>[i] is the price of a given stock on the ith day')
      .when('The user needs to get the max profit can be done')
      .then('The max profit should be <Max Profit>')
      .example(
        val('Prices', [1, 5]),
        val('Max Profit', 4),
        val('Note', 'Two days, the second is higher'),
      )
      .example(
        val('Prices', [5, 1]),
        val('Max Profit', 0),
        val('Note', 'Two days, the second is lower'),
      )
      .example(
        val('Prices', [1, 4, 5]),
        val('Max Profit', 4),
        val('Note', 'Multiple days, only incrementing'),
      )
      .example(
        val('Prices', [5, 4, 1]),
        val('Max Profit', 0),
        val('Note', 'Multiple days, only decrementing'),
      )
      .example(
        val('Prices', [5, 4, 1, 3]),
        val('Max Profit', 2),
        val('Note', 'Multiple days, decrementing then incrementing'),
      )
      .example(
        val('Prices', [1, 4, 3, 2]),
        val('Max Profit', 3),
        val('Note', 'Multiple days, incrementing then decrementing'),
      )
      .example(
        val('Prices', [2, 1, 2, 0, 1]),
        val('Max Profit', 2),
        val('Note', 'Multiple days, a day having zero'),
      )
      .run(_runner);
}

FutureOr<void> _runner(ctx) {
  final List<int> prices = ctx.example.val('Prices');
  final int maxProfit = ctx.example.val('Max Profit');

  final res = p.Solution().maxProfit(prices);
  expect(res, equals(maxProfit));
}
