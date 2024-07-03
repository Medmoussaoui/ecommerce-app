class SuggestionSearchItem {
  final String itemName;

  SuggestionSearchItem({required this.itemName});

  factory SuggestionSearchItem.fromJson(Map<String, dynamic> data) {
    return SuggestionSearchItem(itemName: data["item_name"]);
  }
}
