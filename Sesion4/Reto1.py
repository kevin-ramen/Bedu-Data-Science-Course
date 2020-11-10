from pymongo import MongoClient
#Reto1
"""
Usando la base de datos sample_mflix, proyecta los datos que se solicitan.
1)Fecha, nombre y texto de cada comentario.
2)Título, elenco y año de cada película.
3)Nombre y contraseña de cada usuario.
"""
#1)
client = MongoClient('mongodb+srv://ramen:1234@bedu.mp1jj.mongodb.net/test?authSource=admin&replicaSet=atlas-c2yg6i-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'name': 1, 
    'text': 1, 
    'date': 1, 
    '_id': 0
}

result = client['sample_mflix']['comments'].find(
  filter=filter,
  projection=project
)

#2)
client = MongoClient('mongodb+srv://ramen:1234@bedu.mp1jj.mongodb.net/test?authSource=admin&replicaSet=atlas-c2yg6i-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'title': 1, 
    'cast': 1, 
    'year': 1, 
    '_id': 0
}

result = client['sample_mflix']['movies'].find(
  filter=filter,
  projection=project
)

#3)
client = MongoClient('mongodb+srv://ramen:1234@bedu.mp1jj.mongodb.net/test?authSource=admin&replicaSet=atlas-c2yg6i-shard-0&connectTimeoutMS=600000&socketTimeoutMS=6000000&readPreference=primary&appname=MongoDB%20Compass&ssl=true')
filter={}
project={
    'name': 1, 
    'password': 1, 
    '_id': 0
}

result = client['sample_mflix']['users'].find(
  filter=filter,
  projection=project
)
