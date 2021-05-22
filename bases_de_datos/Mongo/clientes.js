db = db.getSiblingDB('constructora');

cliente = db.clientes.find();

cliente.forEach(client => print("Empresa: " + client.empresa));