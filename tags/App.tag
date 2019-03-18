<app>
	<!-- Spinner -->
	<spinner loading={ loading }></spinner>
	<h1 class="titre">Championnat</h1>
	
	<div> 
		<button  each={ categorie } >{ name }</button>
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
					that.loading=false;
					that.update();
				});
		}
		this.getCompet();
	</script>
</app>