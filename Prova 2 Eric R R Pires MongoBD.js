
db.Filme.insert({
    "Nom_Titulo" : "FilmeX",
    "Ano_Lanco" : 2002
})

db.Ator.insert({
    "Nom_Ator" : "Antony Cleberson",
    "Idt_Sexo" : "M"
})

db.Cliente.insert({
    "Nro_CPF": "019.636.376-84",
    "Nom_Cliente": "Carlinhos J. Peg",
    "Dat_Nascimento": Date("19/04/1995")
})
    
db.DVD_Exemplar.insert({
    "seq_DVD": 1,
    "Ano_aquisição": 2003
})

db.Preço.insert({
    "Vlr-Locação": 50.00,
})

db.Genero.insert({
    "Des_Genero": "Filme de ação e lutas" 
})

db.Locação.insert({
    "Dat_Locacao": Date("11/02/2022"),
    "Hor_locacao": Date("12:34"),
    "Dat_Devolucao": Date("16/02/2022"),
    "Hor_Devolucao": Date("22:34")
})

//--------------- Relações -------------------

db.Filmes.aggregate([
    {
        $lookup:[{
            from: 'Preço',
            localField: "id_Preco",
            foreignField: "_id",
            as:  "Filmes_preço"
        }, 
        {
            from: 'Genero',
            localField: "id_Genero",
            foreignField: "_id",
            as:  "Filme_genero"
        },
        {
            from: 'Ator',
            localField: "ID_Ator",
            foreignField: "_id",
            as:  "Filmes_ator"
        }]
      
    }
])

db.Ator.aggregate([
    {
        $lookup:{
            from: 'Filme',
            localField: "id_Filme",
            foreignField: "_id",
            as:  "Ator_filme"
        }
      
    }
])

db.DVD_Exemplar.aggregate([
    {
        $lookup:[{
            from: 'Filme',
            localField: "id_Filme",
            foreignField: "_id",
            as:  "DVD_filme"
        },
        {
            from: 'Locação',
            localField: "id_Locacao",
            foreignField: "_id",
            as:  "DVD_locacao"
        }]
      
    }
])

db.Locação.aggregate([
    {
        $lookup:[{
            from: 'Preço',
            localField: "id_Preco",
            foreignField: "_id",
            as:  "Locacao_preço"
        }, 
        {
            from: 'Cliente',
            localField: "id_Cliente",
            foreignField: "_id",
            as:  "Locacao_cliente"
        }
        ]
      
    }
])
