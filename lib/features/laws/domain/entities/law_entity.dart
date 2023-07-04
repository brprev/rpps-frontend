enum LawType { municipalLaw, stateLaw, federalLaw }

class LawEntity {
  final String id;
  final String name;
  final LawType type;
  final bool isActive;

  LawEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.isActive,
  });
}
