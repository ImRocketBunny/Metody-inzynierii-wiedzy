:- dynamic pozycja/1,rzecz/2.

miejsce(lózko, 'Lózko').
miejsce(pólka, 'Pólka').
miejsce(komoda, 'Komoda').
miejsce(szafa, 'Szafa naroznikowa').
miejsce(parapet, 'Parapet').
miejsce(biurko1, 'Biurko Poziome').
miejsce(biurko2, 'Biurko Pionowe').

idz(lózko,pólka,l).
idz(pólka, lózko,p).
idz(pólka,biurko2,l).
idz(biurko2,pólka,p).
idz(biurko2, biurko1,l).
idz(biurko1, biurko2,p).
idz(biurko1,parapet, l).
idz(parapet,biurko1, po).
idz(parapet,szafa,l).
idz(szafa,parapet, p).
idz(szafa, komoda, l).
idz(komoda, szafa, p).
idz(komoda, lózko, l).
idz(lózko,komoda, p).

rzecz(komputer, biurko2).
rzecz(monitor, biurko1).
rzecz(klawiatura, biurko1).
rzecz(mysz, biurko1).
rzecz(telefon, biurko1).
rzecz(bluza, lózko).
rzecz(kot, parapet).

male(mysz).
male(kubek).
male(telefon).
duze(komputer).
duze(monitor).
srednie(klawaitura).
srednie(bluza).
wieksze(X,Y) :- duze(X), male(Y).
wieksze(X,Y) :- duze(X),srednie(Y).
wieksze(X,Y) :- srednie(X), male(Y).
wieksze(X,Y) :- wieksze(X,Z),wieksze(Z,Y).

pozycja(lózko).
pc(jednostkaCentralna, ['i7 7700k', 'GTX 1080', '16GB DDR4']).



tujestem :- write('Jestem przy: '), pozycja(Poz),write(Poz),nl.

mogewziac :- write('Moge wziac: '), pozycja(Poz), rzecz(Th, Poz), write(Th),nl.

eq :- write('W rekumam: '), nl, rzecz(Th, 'kieszen'), write(Th),nl.

gps :- write('Moge podejsc do: '),nl,pozycja(X), idz(X,Y,Z), write('W '),write(Z),write(' do '),write(Y),nl.

go(Z) :- pozycja(Y), idz(Y,X,Z),retractall(pozycja(Y)),assert(pozycja(X)).

poloz(Przed) :- pozycja(Poz), retract(rzecz(Przed, 'kieszen')),
    assert(rzecz(Przed, Poz)).
podnies(Przed) :- pozycja(Poz), rzecz(Przed, Poz), retract(rzecz(Przed, Poz)),
               assert(rzecz(Przed, 'kieszen')).
zbadajKomputer(Przed) :- pc(Przed, Skladniki), write(Skladniki),nl,fail.