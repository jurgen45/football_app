<app>
	
	<h1 class="titre">Championnat</h1>
	<spinner loading="{ loading }"></spinner>
	<div class="bouton_categorie"> 
		<button each="{ categorie }" class="bouton_visu" onclick="{ setData }" id="{ id }" name="{ name+': '+area.name }">{ name }</button>
	</div>
	<div class="liste_choix">
		<h2>{nomChampionnat}</h2>
		<ul>
			<li class="liste" onclick="{ affichageSwitch }" id="classement">Classement</li>
			<li class="liste" onclick="{ affichageSwitch }" id="resultat">Résultat</li>
			<li class="liste" onclick="{ affichageSwitch }" id="buteur">Buteurs</li>
		</ul>
	</div>
	<Classement id="{ id }" if="{classementTag}"></Classement>
	<Resultat id="{ id }" if="{resultatTag}"></Resultat>
	<Buteur id="{ id }" if="{buteursTag}"></Buteur>

	<script type="text/javascript">
		this.mixin('serviceAjax');
		this.loading = false;
		this.categorie=[];
		this.id=0;
		this.name="";
		this.nomChampionnat="";
		this.classementTag=false;
		this.resultatTag=false;
		this.buteursTag=false;
		t=this;

		this.getCompet = function(){
			this.loading=true;
			this.getChampionnats()
				.then(function(data){
					t.categorie=data.competitions;
					console.log(t.categorie);
					t.loading=false;
					t.update();
				});
		}
		this.getCompet();

		this.setData = function(evenement){
			evenement.preventDefault();
			var c=document.getElementById("classement");
			var r=document.getElementById("resultat");
			var b=document.getElementById("buteur");
			t.id = evenement.target.id;
			t.nomChampionnat = evenement.target.name;
			t.nomArea = evenement.target.zone;
			t.classementTag=false;
			t.resultatTag=false;
			t.buteursTag=false;
			c.setAttribute("class", "liste");
			r.setAttribute("class", "liste");
			b.setAttribute("class", "liste");
			t.update();
		}

		this.affichageSwitch = function(evenement){
			evenement.preventDefault();
			t.name=evenement.target.id;
			var c=document.getElementById("classement");
			var r=document.getElementById("resultat");
			var b=document.getElementById("buteur");
			switch(this.name){
				case 'classement' :
					this.classementTag=true;
					this.resultatTag=false;
					this.buteursTag=false;
					c.setAttribute("class", "liste_underline");
					r.setAttribute("class", "liste");
					b.setAttribute("class", "liste");
					break;
				case 'resultat' :
					this.classementTag=false;
					this.resultatTag=true;
					this.buteursTag=false;
					c.setAttribute("class", "liste");
					r.setAttribute("class", "liste_underline");
					b.setAttribute("class", "liste");
					break;
				case 'buteur' :
					this.classementTag=false;
					this.resultatTag=false;
					this.buteursTag=true;
					c.setAttribute("class", "liste");
					r.setAttribute("class", "liste");
					b.setAttribute("class", "liste_underline");
					break;
			}
		}
	</script>
</app>