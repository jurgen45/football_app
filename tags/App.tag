<app>
	<!-- Spinner -->
	<spinner loading={ loading }></spinner>
	<h1 class="titre">Championnat</h1>
	
	<div class="bouton_categorie"> 
		<button each={ categorie } class="bouton_visu" onclick={  } >{ name }</button>
	</div>

	<script type="text/javascript">

		this.mixin('serviceAjax');
		this.loading = false;  // booléen qui controle le spinner
		this.update();
		this.categorie=[];

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
	</script>
</app>