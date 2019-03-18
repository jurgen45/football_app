function constantes(){

var c = {
	sizes:[
	{
		label:"Grand",
		size:6
	},
	{
		label:"Moyen",
		size:4
	},
	{
		label:"Petit",
		size:2
	}

],

types: [
	{                                                                                                                                                                                                                 
		name : 'popular',
		label	: 'Populaires'
	},
	{
		name : 'top_rated',
		label	: 'Mieux notés'
	},
	{
		name : 'upcoming' ,
		label 	: 'À venir'
	},
	{
		name : 'now_playing' ,	
		label : "À l'affiche"
	}],
	genres :[
		{
			"id": 28,
			"name": "Action"
		},
		{
			"id": 12,
			"name": "Adventure"
		},
		{
			"id": 16,
			"name": "Animation"
		},
		{
			"id": 35,
			"name": "Comedy"
		},
		{
			"id": 80,
			"name": "Crime"
		},
		{
			"id": 99,
			"name": "Documentary"
		},
		{
			"id": 18,
			"name": "Drama"
		},
		{
			"id": 10751,
			"name": "Family"
		},
		{
			"id": 14,
			"name": "Fantasy"
		},
		{
			"id": 36,
			"name": "History"
		},
		{
			"id": 27,
			"name": "Horror"
		},
		{
			"id": 10402,
			"name": "Music"
		},
		{
			"id": 9648,
			"name": "Mystery"
		},
		{
			"id": 10749,
			"name": "Romance"
		},
		{
			"id": 878,
			"name": "Science Fiction"
		},
		{
			"id": 10770,
			"name": "TV Movie"
		},
		{
			"id": 53,
			"name": "Thriller"
		},
		{
			"id": 10752,
			"name": "War"
		},
		{
			"id": 37,
			"name": "Western"
		}
	],
	genre:function(id){
	var g = 	this.genres.find(function(value){
		return id == value.id;
	})
		if(g) return g.name;
	}
};
return c;
}
