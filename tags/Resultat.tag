<Resultat>
	<spinner loading="{ loading }"></spinner>
	<div >

	<FORM onSubmit={setEquip}>
		<label for="choix_equip_away" class="choice_equipe">Away:</label>
	    <SELECT name="choix_equip_away" size="1" class="choice_equipe">
		    <OPTION each="{n in equipeAway}" onClick="{ setEquipe }" id="{n}" name="{ n }">{n}</OPTION>
	    </SELECT>
	    <label for="choix_equip_home" class="choice_equipe">Home:</label>
	    <SELECT name="choix_equip_home" size="1" class="choice_equipe">
		    <OPTION each="{n1 in equipeHome}" onClick="{ setEquipe }" id="{n1}" name="{ n1 }">{n1}</OPTION>
	    </SELECT>
    </FORM>
    <FORM>
	    <SELECT name="date" size="1" class="choice">
		    <OPTION each="{i in nbJours}" onClick="{ setDay }" id="{i}">{i}</OPTION>
	    </SELECT>
    </FORM>
		<h4>{"journée "+currentMatchday}</h4>
		<table each="{ res in mtc }" if="{ res.matchday == currentMatchday && res.awayTeam.name == currentEquip }" class="tableauRes">
			<tr>
				<td>{res.group}</td>
				<td>{res.homeTeam.name}</td>
				<td>{res.score.fullTime.homeTeam+" - "+res.score.fullTime.awayTeam}</td>
				<td>{res.awayTeam.name}</td>
			</tr>
		</table>
	</div>
	
	<p></p>
	<script type="text/javascript">
		this.loading = false;
		this.mixin('serviceAjax');
		var t=this;
		this.mtc=[];
		this.nbJournée=0;
		this.id=opts.id;
		this.currentMatchday=1;
		this.nbJours=[];
		this.nbJ=0;
		this.tailleTable=0;
		this.equipeAway=[];
		this.equipeHome=[];

		this.getMatch = function(){
			this.loading=true;
			this.getMatchs(t.id)
				.then(function(data){
					t.mtc=data.matches;
					console.log(t.mtc);
					t.nbJ=t.mtc[t.mtc.length-1].matchday;
					for (var i = 1; i <= t.nbJ; i++) {
						t.nbJours[i]=i;
					}
					for (var i = 0; i < t.mtc.length; i++) {
						t.equipeHome[i]=t.mtc[i].homeTeam.name;
					}
					for (var d = 0; d < t.mtc.length; d++) {
						t.equipeAway[d]=t.mtc[d].awayTeam.name;
					}
					//console.log(equipeHome);
					//console.log(equipeAway);
					t.loading=false;
					t.update();
				});
		}
		this.getMatch();

		this.setDay = function(evenement){
			t.currentMatchday=parseInt(evenement.target.id, 10);
			t.update();
		}

		this.setEquipe = function(evenement){
			t.currentEquip=evenement.target.id;
			console.log(evenement.target.id);
			t.update();
		}

	</script>
</Resultat>