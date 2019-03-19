ListView.builder(
padding: EdgeInsets.only(top: 10),
itemCount: snapshot.data["bases"].length,
itemBuilder: (context, index) {
List<String> base = new List<String>();
snapshot.data["bases"].forEach((cadaBase) {
base.add(cadaBase["base"]);
});

List<String> descricao = new List<String>();
snapshot.data["bases"].forEach((cadaDesc) {
descricao.add(cadaDesc["descricao"]);
});

return ListTile(
leading: const Icon(
Icons.location_city,
size: 35,
),
title: Text(base[index]),
subtitle: Text(descricao[index]),
onTap: () {
Navigator.of(context).push(MaterialPageRoute(
builder: (context) => PedidoGraph()));
},
trailing: Icon(
Icons.traffic,
size: 45,
),
contentPadding:
EdgeInsets.fromLTRB(30, 0, 60, 0),
);
});