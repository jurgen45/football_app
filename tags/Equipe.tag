<equipe>
	<spinner loading="{ loading }"></spinner>
	<div class="corps">
		<div class="info">
			<h1>{ equipeTab.area.name }</h1>
			<img src="{ equipeTab.crestUrl }"/>
			<p>{ equipeTab.venue}</p>
			<p>{ equipeTab.founded}</p>
		
			<form class="choix_position">
			    <label for="choix_position" class="choice_position">Home:</label>
			    <select name="choix_position" size="1" class="choice_position">
				    <option each="{n1 in positionTab}" onclick="{ setPosition }" id="{n1}" name="{ n1 }">{n1}</option>
			    </select>
		    </form>
	    </div>
	    <div class="struct">
	    	<div each="{ el in equipeTab.squad }" if="{ el.position == filtrePosition }" class="joueur_info">
				<h5>{ el.name }</h5>
				<p><em>Née le: </em>{el.dateOfBirth}</p>
				<p><em>Nationalité: </em>{el.nationality}</p>
				<p><em>Numero: </em>{el.shirtNumber}</p>
			</div>
	    </div>
	</div>
	<script>
		this.loading = false;
		this.mixin('serviceAjax');
		this.equipeTab=[];
		this.positionTab=[];
		this.filtrePosition="";
		this.id=opts.id;
		var t=this;

		this.getEq = function(){
			this.loading=true;
			this.getEquipe(t.id)
				.then(function(data){
					t.equipeTab=data;
					for (var i = 0; i < data.squad.length; i++) {
						t.positionTab[i]=data.squad[i].position;
					}
					t.positionTab=t.cleanTab(t.positionTab);
					t.loading=false;
					t.update();
				});
		}
		this.getEq();

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

		this.setPosition = function(evenement){
			t.filtrePosition=evenement.target.id;
		}


	</script>
</equipe>