function makeServiceAjax(){
	var apikey="4867ca38ca064e0a94e620f2b1947f77";
	var urlBase = "https://api.football-data.org/v2";
	var service = {
		getChampionnats:getChampionnats
	};

	function getChampionnats(){
		var url = urlBase+"/competitions";
		return new Promise(function(resolve,reject){
			http = new XMLHttpRequest();
			http.open("GET",url);
			http.setRequestHeader("X-Auth-Token", apikey);
			http.responseType="json";
			http.send();
			http.onload=function(){
				resolve(this.response);
			};
			http.onerror=function(){
				reject("Erreur");
			};
		});
	}

	function getListCompet(type){
		switch(type){
			case 'popular' : 
				url = urlBase+"/movie/popular?api_key="+apikey+"&language=fr-FR&page=";
				break;
			case 'top_rated' :
				url = urlBase+"/movie/top_rated?api_key="+apikey+"&language=fr-FR&page=";
				break;
			case 'now_playing' :
				url = urlBase+"/movie/now_playing?api_key="+apikey+"&language=fr-FR&page=";
				break;
			case 'upcoming' :
				url = urlBase+"/movie/upcoming?api_key="+apikey+"&language=fr-FR&page=";
				break;

			default:
				url = urlBase+"/BL1";
		}
		return new Promise(function(resolve,reject){
			var http = new XMLHttpRequest();
			http.open("GET",url);
			http.responseType="json";
			http.send();
			http.onload=function(){
				resolve(http.response);
			};
			http.onerror=function(){
				reject("Erreur");
			};
		});
	}
	return service;
}
