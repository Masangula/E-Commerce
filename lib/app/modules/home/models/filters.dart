enum Filters {
  ratings,
  prices,
  shuffled,
}

class Filter {
  String? displayText;
  Filters? filterType;
  String? description;

  Filter({
    this.displayText,
    this.filterType,
    this.description,
  });
}
