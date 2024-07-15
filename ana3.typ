#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with()
#show link: underline

#let definition = thmbox("definition", "Definition", base_level: 1, inset: 0em)
#let remark = thmplain("bemerkung", "Bemerkung", base_level: 1, inset: 0em)
#let theorem = thmbox("satz", "Satz", base_level: 1, inset: 0em)
#let corollary = thmplain("corollar", "Corollar", base: "theorem", base_level: 1, inset: 0em)
#let example = thmplain("beispiel", "Beispiel", base_level: 1, inset: 0em)
#let lemma = thmbox("lemma", "Lemma", base_level: 1, inset: 0em)
#let proposition = thmbox("proposition", "Proposition", base_level: 1, inset: 0em)
#let proof = thmproof("beweis", "Beweis", base_level: 1, inset: 0em)


= Kapitel 0

#definition("Topologie")[
Sei $X$ eine Menge. Eine Familie $cal(T) subset cal(P)(X)$ heißt *Topologie* auf $X$, falls gilt:
+ $emptyset, X in cal(T)$,
+ $A, B in cal(T) => A sect B in cal(T)$, $quad quad$ d.h. $cal(T)$ ist abgeschlossen unter endlichen Durchschnitten
+ $A_i in cal(T) => union_(i in I) A_i in cal(T)$, $quad quad$ d.h. $cal(T)$ ist abgeschlossen unter beliebigen Vereinigungen.

Ein Element $O in cal(T)$ heißt dann *offene Menge*.
]

#definition("Punkte, Begriffe")[
Sei $S subset.eq X$, $p in X$. Der Punkt $p$ heißt
- *innerer Punkt* von $S$, falls gilt: $exists O in cal(T): p in O$ und $O subset.eq S$,
- *äußerer Punkt* von $S$, falls gilt: $exists O in cal(T): p in O$ und $O subset.eq X\\S$,
- *Randpunkt* von $S$, falls gilt: $forall O in cal(T)$ mit $p in O: O sect S != emptyset$ und $O sect S^c != emptyset$,
- *Häufungspunkt* von $S$, falls gilt: $forall O in cal(T)$ mit $p in O: O\\{p} sect S != emptyset$.
]

#proposition[
$p$ ist Randpunkt von $S$ genau dann wenn $p$ weder innerer Punkt noch äußerer Punkt von $S$ ist.
]
#proof[
Siehe Notizen PDF Expert.
]

#definition("Mengen, Begriffe")[Sei $S subset.eq X$.
- $S^o:={p in X: p "ist innerer Punkt von" S}$ heißt *Inneres* von $S$,
- $"Ext"(S):={p in X: p "ist äußerer Punkt von" S}$ heißt *Äußeres* von $S$,
- $diff S := {p in X: p "ist Randpunkt von" S}$ heißt *Rand* von $S$,
- $overline(S):=S union diff S$ heißt *Abschluss* von $S$.
]

#example[
$X = bb(R)$, $cal(T)={emptyset,bb(R)}union{(a,infinity)|a in bb(R)}$. Betrachte $S=(0,1)$:
- Ist keine offene Menge,
- hat keine inneren Punkte, d.h. $S^o=emptyset$,
- $"Ext"(S)=(1,infinity)$
- $diff S =(-infinity,1]$
]

#definition("Konvergenz einer Folge")[
Sei $(X,cal(T))$ ein topologischer Raum, $(a_n)_(n in bb(N))$ eine Folge in X. Die Folge heißt *konvergent* gegen $a in X$, falls:
$ forall O in cal(T) "mit" a in cal(T) quad exists N in bb(N) quad forall n>N: quad a_n in O. $ In Worten: jede offene Menge, die $a$ enthält, enthält auch fast alle Folgenglieder $a_n$. Wir nennen $a$ einen *Grenzwert* der Folge $(a_n)_(n in bb(N))$ und schreiben $a_n -> a$.
]

#remark[
Mit dieser Definition ist der Grenzwert i.Allg. *nicht eindeutig*! Wir betrachten dazu das Beispiel von vorher:
Sei $X = bb(R)$, $cal(T)={emptyset,bb(R)}union{(a,infinity)|a in bb(R)}$. Sei $(a_n)_(n in bb(N))=(1/n)_(n in bb(N)).$ Wir sehen:
- $a_n -> 0$,
- $a_n -> -1$,
- $a_n -> a$ mit $a <= 0$,
d.h. der Grenzwert ist nicht eindeutig! Um das zu berücksichtigen definieren wir folgenden Begriff:
]

#definition("Hausdorffraum")[
Ein topologischer Raum $(X, cal(T))$ heißt *Hausdorffraum* falls gilt: $ "Für alle" x,y in X "mit" x!=y "gibt es offene Umgebungen" U, V "von" x,y "mit" U sect V = emptyset $
]

#theorem("Eindeutigkeit des Grenzwerts in Hausdorffräumen")[
Sei $(X,cal(T))$ ein Hausdorffraum. Dann sind Folgengrenzwerte eindeutig.
]

#proof[
Sei $(a_n)_(n in bb(N))$ eine Folge in $X$ mit $a_n -> a$. Angenommen $a_n -> b$, $a!=b$. Da $a_n -> a$, enthält eine beliebige offene Umgebung von $a$ fast alle Folgenglieder $a_n$. Da $(X,cal(T))$ Hausdorff ist, gibt es offene Umgebungen $U,V$ von $a,b$ mit $U sect V = emptyset$. $U$ enthält fast alle Folgenglieder von $(a_n)_(n in bb(N))$ und wegen $U sect V = emptyset$ kann $V$ nicht fast alle Folgenglieder von $(a_n)_(n in bb(N))$ enthalten. Das ist ein Widerspruch zu $a_n -> b$.
]

