<information>
	<ul>
		<li>
			Classement
		</li>
		<li>
			Résultat
		</li>
		<li>
			Buteurs
		</li>
	</ul>

	<script type="text/javascript">

		this.mixin('serviceAjax');
		this.loading = false;  // booléen qui controle le spinner
		this.update();
		this.team=[];

		this.getTeam = function(){
			this.loading=true;
			this.update();
			var that=this;
			this.getTeamPourCompet()
				.then(function(data){
					that.team=data.competitions;
					console.log(that.team);
					that.loading=false;
					that.update();
				});
		}
		this.getTeam();
	</script>
</information>