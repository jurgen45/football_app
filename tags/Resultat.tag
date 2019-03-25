<Resultat>
	<spinner loading="{ loading }"></spinner>
	<div >

	<form>
	    <label for="choix_equip" class="choice_equipe">Home:</label>
	    <select name="choix_equip" size="1" class="choice_equipe">
		    <option each="{n1 in equipe}" onClick="{ setEquipe }" id="{n1}" name="{ n1 }">{n1}</option>
	    </select>
    </form>
    <form>
	    <select name="date" size="1" class="choice">
		    <option each="{i in nbJours}" onClick="{ setDay }" id="{i}">{i}</option>
	    </select>
    </form>
		<h4>{"journée "+currentMatchday}</h4>
		<table each="{ res in mtc }" if="{ res.matchday == currentMatchday && !display }" class="tableauRes">
			<tr>
				<td>{res.group+" "+(new Date(res.utcDate)).getHours()+":"+(new Date(res.utcDate)).getMinutes()+":"+(new Date(res.utcDate)).getSeconds()}</td>
				<td><a href="./equipe.html?id={res.homeTeam.id}">{res.homeTeam.name}</a></td>
				<td>{res.score.fullTime.homeTeam+" - "+res.score.fullTime.awayTeam}</td>
				<td><a href="./equipe.html?id={res.awayTeam.id}">{res.awayTeam.name}</a></td>
			</tr>
		</table>

		<table each="{ res in mtc }" if="{ res.matchday == currentMatchday && res.awayTeam.name == currentEquip && display || res.matchday == currentMatchday && res.homeTeam.name == currentEquip && display || res.awayTeam.name == currentEquip && display}" class="tableauRes">
			<tr>
				<td>{res.group+" "+(new Date(res.utcDate)).getHours()+":"+(new Date(res.utcDate)).getMinutes()+":"+(new Date(res.utcDate)).getSeconds()}</td>
				<td><a href="./equipe.html?id={res.homeTeam.id}">{res.homeTeam.name}</a></td>
				<td>{res.score.fullTime.homeTeam+" - "+res.score.fullTime.awayTeam}</td>
				<td><a href="./equipe.html?id={res.awayTeam.id}">{res.awayTeam.name}</a></td>
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
		this.currentEquip="aucun";
		this.nbJours=[];
		this.nbJ=0;
		this.tailleTable=0;
		this.equipeAway=[];
		this.equipe=[];
		this.display=false;

		this.getMatch = function(){
			this.loading=true;
			this.getMatchs(t.id)
				.then(function(data){
					t.mtc=data.matches;
					t.nbJ=t.mtc[t.mtc.length-1].matchday;
					for (var i = 1; i <= t.nbJ; i++) {
						t.nbJours[i]=i;
					}
					t.equipe[0]="aucun";
					t.equipeAway[0]="aucun";
					for (var i = 1; i < t.mtc.length; i++) {
						t.equipe[i]=t.mtc[i].homeTeam.name;
						t.equipeAway[i]=t.mtc[i].awayTeam.name;
					}
					t.equipe=t.equipe.concat(t.equipeAway); //concatener les deux tableaux
					t.equipe=t.cleanTab(t.equipe);
					t.loading=false;
					t.update();
				});
		}
		this.getMatch();

		this.cleanTab = function(array) { //supprimer les doublons
			  var i, j, len = array.length, sortieTab = [], tempTab = {};
			  for (i = 0; i < len; i++) {
			    tempTab[array[i]] = 0;
			  }
			  for (j in tempTab) {
			    sortieTab.push(j);
			  }
			  return sortieTab;
		}

		this.setDay = function(evenement){
			t.currentMatchday=parseInt(evenement.target.id, 10);
			t.update();
		}

		this.setEquipe = function(evenement){
			t.currentEquip=evenement.target.id;
			if (t.currentEquip != "aucun") { //selectionner aucun pour avoir uniquement l'affichage par jour sans prendre en compte les equipes
				t.display = true;
			}
			else{
				t.display = false;
			}
			t.update();
		}

	</script>
</Resultat>