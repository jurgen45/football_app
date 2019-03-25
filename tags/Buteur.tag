<Buteur>
	<spinner loading="{ loading }"></spinner>
	<table class="tableau">
		<tr>
			<th>Buts</th>
			<th>Nom</th>
			<th>Equipe</th>
		</tr>
		<tr each="{b in buteurTab}">
			<td>{b.numberOfGoals}</td>
			<td>{b.player.name}</td>
			<td><a href="./equipe.html?id={b.team.id}">{b.team.name}</a></td>
		</tr>
	</table>
	<script>
		this.id=opts.id;
		this.loading = false;
		this.mixin('serviceAjax');
		this.buteurTab=[];
		var t=this;

		this.getButeur = function(){
			this.loading=true;
			this.getButeurs(t.id)
				.then(function(data){
					t.buteurTab=data.scorers;
					console.log(t.buteurTab);
					t.current=data.season;
					t.loading=false;
					t.update();
				});
		}
		this.getButeur();
	</script>
</Buteur>