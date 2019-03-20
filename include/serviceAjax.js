function makeServiceAjax(){
	var apikey="caa6ca42769041fa9badc7f56eea6835";
	var urlBase = "https://api.football-data.org/v2";
	var plan="TIER_ONE";
	var service = {
		getTeam:getTeam,
		getChampionnats:getChampionnats
	};

	function getChampionnats(){
		var url = urlBase+"/competitions/?plan="+plan;
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

	function getTeam(id){
		url=urlBase+"/competitions/"+id+"/teams";
		return new Promise(function(resolve,reject){
			var http = new XMLHttpRequest();
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
	return service;
}
