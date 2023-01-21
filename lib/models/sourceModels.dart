class SourceModels {

  final String name;

  SourceModels(this.name);
  static SourceModels fromMap(Map source) {
    return SourceModels(source['name']);
  }
}