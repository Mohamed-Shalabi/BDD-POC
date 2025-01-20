class Solution {
  int maxProfit(List<int> prices) {
    var profit = 0;
    var selected = -1;

    for (int i = 0; i < prices.length; i++) {
      final price = prices[i];
      final nextPrice = i == prices.length - 1 ? null : prices[i + 1];
      if (selected == -1) {
        selected = price;
      }

      if (nextPrice != null && nextPrice > price) {
        continue;
      }

      profit += price - selected;
      selected = -1;
    }

    return profit;
  }
}
