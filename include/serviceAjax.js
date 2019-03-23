function makeServiceAjax(){
	var apikey="caa6ca42769041fa9badc7f56eea6835";
	var urlBase = "https://api.football-data.org/v2";
	var plan="TIER_ONE";
	//var nom="";
	//this.id=0;
	//var that=this;

	var service = {
		getButeurs:getButeurs,
		getClassement:getClassement,
		getMatchs:getMatchs,
		getEquipe:getEquipe,
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

	function getClassement(id){
		url=urlBase+"/competitions/"+id+"/standings";
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

	function getMatchs(id){
		url=urlBase+"/competitions/"+id+"/matches";
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

	function getButeurs(id){
		url=urlBase+"/competitions/"+id+"/scorers";
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

	function getEquipe(id){
		url=urlBase+"/teams/"+id;
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
