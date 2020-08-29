<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="uputstvo lead" data-toggle="modal" data-target="#exampleModal">UPUTSTVO
	<i class="fas fa-book-open"></i>
</div>
<!-- Modal -->
<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">UPUTSTVO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h2>O aplikaciji</h2>
		<p class="text-muted">
			Ova veb aplikacija predstavlja pojednostavljeni sajt za pružanje informacija, kritika i preporuka o filmovima i serijama.
			Na njemu svi prijavljeni korisnici se mogu dopisivati u zajedničkom četu i razmenjivati mišljenja i preporuke.
		</p>
		<p class="text-muted">
			Postoje dve vrste korisnika: korisnik i admin. <span style="color: blue">Korisnik</span> ima mogućnost pretrage i pregleda detalja o filmovima kao i mogućnost
			dopisivnja u četu sa svim ostalim prijavljenim korisnicima. <span style="color: red">Admin</span> ima sve mogućnosti običnog korisnika, a pored toga i mogućnost dodavanja 
			novih filmova i upravljanje korisnicima. Upravljanje korisnicima podrazumeva promenu uloge ( korisnik <-> admin ) i mogućnost 
			brisanja korisnika.    
		</p>
		<h2>Prijava</h2>
		<p class="text-muted">
			Korisnik/admin može da se prijavi na sistem na strani za prijavu ukoliko je prethodno registrovan. 
		    Prijavljeni korisnik na svim narednim stranama u svakom trenutku može da se odjavi iz sistema klikom na dugme <b>Odjavi se</b> u meniju. 
		</p>
		
		<h2>Registracija</h2>
		<p class="text-muted">
			Forma za registraciju se otvara klikom na link <b>REGISTRACIJA</b> na strani za prijavljivanje. Nakon što je forma ispravno popunjena,
			čuvanje korisnika se vrši klikom na drugme <b>REGISTRACIJA</b>. Tako registrovani korisnik je tipa <span style="color: blue">korisnik</span>. 
			Da bi postao <span style="color: red">admin</span>, drugi admin korisnik mora da mu dodeli tu ulogu na strani za upravljanje 
			korisnicima koju vide samo admini. 
		</p>
		
		<h2>Početna strana</h2>
		<p class="text-muted">
			Na početnoj strani se nalazi lista svih filmova sa kratkim opisom svakog.  Na vrhu strane postoji polje za pretragu filmova po
			nazivu. <span style="color: red">Admin</span> korisnici ispod polja za pretragu imaju dugme <b>DODAJ FILM</b> koje vodi do strane sa
			formom za unos novog filma u sistem. Takođe pored svakog filma za <span style="color: red">admin</span> korisnike postoji dugme 
			za brisanje filma iz sistema. 
		</p>
		
		<h2>Detalji o filmu</h2>
		<p class="text-muted">
			Klikom na određeni film iz liste na početnoj strani odlazi se na stranu na kojoj su prikazani svi detalji o filmu. 
			<span style="color: red">Admin</span> korisnici na vrhu strane imaju dugme <b>IZMENI</b> kojim se otvara forma za izmenu podataka
			o filmu. Izmene se čuvaju klikom na dugme <b>SAČUVAJ FILM</b>.
		</p>
		
		<h2>Čet soba</h2>
		<p class="text-muted">
			Na ovoj strani prijavljeni <span style="color: blue">korisnici</span> i <span style="color: red">admini</span> sistema mogu 
			razmenjivati poruke koje su prikazane u velikom pravougaonku sa leve strane.
			Da bi se korisnik priključio četu potrebno je da klikne na dugme <b>PRIKLJUČI SE</b> sa leve strane. Ispod tog dugmeta se nalazi lista
			korisnika koju su priključeni četu. Poruka se unosi u polje ispod velikog pravougaonika, a šalje se klikom na dugme <b>POŠALJI</b>. 
			Korisnik može da se isključi sa četa klikom na dugme <b>ISKLJUČI SE</b> ili napuštanjem ove strane. 
		</p>
		
		<h2>Korisnici</h2>
		<p class="text-muted">
			Ovo je strana za prikaz liste korisnika sistema kao i upravljanje korisnicima. Nju vide samo <span style="color: red">admini</span>. 
			Za promenu tipa korisnika ( korisnik <-> admin ) potrebno je kliknuti na dugme u koloni <b>Tip</b> u redu željenog korisnika. Brisanje korisnika 
			se vrši klikom na dugme u koloni <b>Obriši</b> u redu željenog korisnika.
		</p>
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zatvori</button>
      </div>
    </div>
  </div>
</div>