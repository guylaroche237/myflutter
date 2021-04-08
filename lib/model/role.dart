class Role{
  int id;
  String name;

  Role({this.id, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String get normalizedName => _capitalize(this.name.replaceAll("ROLE_",""));
  factory Role.admin() {
    return Role(id: 2, name: "ADMIN");
  }
  factory Role.agent() {
    return Role(id: 3, name: "AGENT");
  }
  factory Role.owner(){
    return Role(id: 4,name: "OWNER");
  }
  factory Role.manager() {
    return Role(id: 5, name: "MANAGER");
  }
  factory Role.agentsale() {
    return Role(id: 6, name: "AGENT_SALE");
  }
  factory Role.agentstock() {
    return Role(id: 7, name: "AGENT_STOCK");
  }
  static List<Role> available() {
    return [Role.admin(), Role.agent(),Role.manager(),Role.agentsale(),Role.agentstock(),Role.agentsale(),Role.owner()];
  }
}