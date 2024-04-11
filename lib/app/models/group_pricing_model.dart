enum TypePricing { BRONZE, SILVER, GOLD, DIAMOND }

class GroupPricing {
  GroupPricing({
    required this.type,
  });

  final TypePricing type;
}
