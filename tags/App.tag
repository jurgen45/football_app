<app>
	<!-- Spinner -->
	<spinner loading="{ loading }"></spinner>
	<h1 class="titre">Championnat</h1>
	
	<div class="bouton_categorie"> 
		<button each="{ categorie }" class="bouton_visu" onclick="{ setData }" id="{ id }" name="{ name }">{ name }</button>
	</div>
	<div class="liste_choix">
		<h2>{nomChampionnat}</h2>
		<ul>
			<li class="liste">Classement</li>
			<li class="liste">Résultat</li>
			<li class="liste">Buteurs</li>
		</ul>
		<p each="{ team }">{ type }</p>
	</div>
	<Classement name="clt"></Classement>

	<script type="text/javascript">
		this.mixin('serviceAjax');
		this.loading = false;  // booléen qui controle le spinner
		this.categorie=[];
		this.team=[];
		this.id=0;
		this.nomChampionnat="";
		t=this;

		this.getCompet = function(){
			this.loading=true;
			var that=this;
			this.getChampionnats()
				.then(function(data){
					that.categorie=data.competitions;
					that.loading=false;
					that.update();
				});
		}
		this.getCompet();

		this.setData = function(evenement){
			evenement.preventDefault();
			t.id = evenement.target.id;
			t.nomChampionnat = evenement.target.name;
			this.setInformation(evenement.target.id,evenement.target.name);
			t.update();
		}

		
		/*this.getEquipe = function(){
			this.loading=true;
			var that=this;
			this.getTeam()
				.then(function(data){
					t.team=data.standings[0];
					console.log(that.team);
					t.loading=false;
					t.update();

				});
		}*/
	</script>
</app>