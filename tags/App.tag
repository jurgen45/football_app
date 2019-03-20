<app>
	<!-- Spinner -->
	<spinner loading="{ loading }"></spinner>
	<h1 class="titre">Championnat</h1>
	
	<div class="bouton_categorie"> 
		<button each="{ categorie }" class="bouton_visu" onclick="{ setId }" id="{ id }" >{ name }</button>
	</div>
	<div>
		<ul>
			<li onclick="{ update }">
				Classement
			</li>
			<li>
				Résultat
			</li>
			<li>
				Buteurs
			</li>
		</ul>
		<p each="{ team }">{ name }</p>
	</div>
	<script type="text/javascript">

		this.mixin('serviceAjax');
		this.loading = false;  // booléen qui controle le spinner
		this.categorie=[];
		this.team=[];
		this.id=0;
		var t= this;

		this.getCompet = function(){
			this.loading=true;
			this.update();
			var that=this;
			this.getChampionnats()
				.then(function(data){
					that.categorie=data.competitions;
					console.log(that.categorie);
					that.loading=false;
					that.update();
				});
		}
		this.getCompet();

		this.setId = function(evenement){
			this.id = evenement.target.id;
			console.log("id vaut: "+this.id);
			this.update();
			this.getEquipe();
		}

		this.getEquipe = function(){
			this.loading=true;
			this.update();
			var that=this;
			console.log("id dans fonction: "+this.id);
			this.getTeam(this.id)
				.then(function(data){
					console.log(that.id);
					that.team=data.teams;
					console.log(data.teams);
					that.loading=false;
					that.update();
				});
		}
	</script>
</app>