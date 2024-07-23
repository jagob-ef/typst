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
#definition("Umgebung")[
Sei $(X, cal(T))$ ein topologischer Raum, $x in X$. Eine Menge $U subset.eq X$ heißt Umgebung von $x$, falls es eine offene Menge $O$ gibt mit $x in O subset.eq U$.
]
#proposition[
Eine Menge ist offen genau dann wenn sie Umgebung jeder ihrer Punkte ist.
]<proposition-offen>
#proof[
"$arrow.r.double$": Sei $M$ eine offene Menge, $x in M$ beliebig. Wir finden eine offene Menge $O=M$, für die $x in O=M subset.eq M$ gilt, d.h. $M$ ist eine Umgebung von $x$.\
"$arrow.l.double$": Sei $M$ eine Menge die Umgebung jeder ihrer Punkte ist, d.h. für jedes $x in M$ gibt es eine offene Mengen $O_x$ mit $x in O_x subset.eq M$. Dann ist $union_(x in M) O_x$ eine Vereinigung offener Mengen und es gilt $M = union_(x in M) O_x$, also ist $M$ offen.
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
"$arrow.r.double$": Sei $p$ Randpunkt von $S$, d.h. für alle offenen Mengen $O$ mit $p in O$ gilt $O sect S != emptyset$ und $O sect S^c != emptyset$. Wäre $p$ ein innerer Punkt von $S$, dann gäbe es eine offene Menge $O$ mit $p in O$ und $O subset.eq S$, was ein Widerspruch zu $O sect S^c != emptyset$ wäre. Wäre $p$ ein äußerer Punkt von $S$, dann gäbe es eine offene Menge $O$ mit $p in O$ und $O subset.eq S^c$, was ein Widerspruch zu $O sect S != emptyset$ wäre. Also ist $p$ weder innerer noch äußerer Punkt von $S$.\
"$arrow.l.double$": Sei $p$ weder innerer noch äußerer Punkt von $S$, d.h. es gibt keine offene Menge $O$ mit $p in O$ und $O subset.eq S$ oder $O subset.eq S^c$. Äquivalent: Für alle offenen Mengen $O$ mit $p in O$ muss $O subset.eq.not S$ und $O subset.eq.not S^c$ gelten. Für diese Mengen gilt somit $O sect S^c != emptyset$ und $O sect S != emptyset$, also ist $p$ ein Randpunkt.
]

#definition("Mengen, Begriffe")[Sei $S subset.eq X$.
- $S^o:={p in X: p "ist innerer Punkt von" S}$ heißt *Inneres* von $S$,
- $"Ext"(S):={p in X: p "ist äußerer Punkt von" S}$ heißt *Äußeres* von $S$,
- $diff S := {p in X: p "ist Randpunkt von" S}$ heißt *Rand* von $S$,
- $S$ heißt *abgeschlossen*, falls $X\\S$ offen ist,
- Die kleinste abgeschlossene Menge, die $S$ enthält, heißt *Abschluss* von $S$. Wir schreiben hierfür $overline(S)$.
]

#example[
$X = bb(R)$, $cal(T)={emptyset,bb(R)}union{(a,infinity)|a in bb(R)}$. Betrachte $S=(0,1)$:
- Ist keine offene Menge,
- hat keine inneren Punkte, d.h. $S^o=emptyset$,
- $"Ext"(S)=(1,infinity)$
- $diff S =(-infinity,1]$
]

#lemma[
Sei $I$ eine beliebige Indexmenge, $i in I$, $A_i subset.eq X$ abgeschlossen. Dann ist $sect.big_(i in I) A_i$ abgeschlossen.
]<proposition-durchschnitt-abg>

#proof[
$sect.big_(i in I) A_i$ abgeschlossen heißt $X\\ sect.big_(i in I) A_i$ offen. Zeige Offenheit: $ X\\ sect.big_(i in I) A_i = union.big_(i in I) X\\A_i, $ d.h. offen als Vereinigung offener Mengen.
]

#proposition[Sei $(X, cal(T))$ ein topologischer Raum, $S subset.eq X$. Dann gilt:
$ overline(S) = sect.big underbrace({A | S subset.eq A, A "abgeschlossen"}, =: cal(A)). $

]
#proof[
Wir zeigen, dass $sect cal(A)$ die kleinste abgeschlossene Menge ist, die $S$ enthält.
Da alle $A$ abgeschlossen, ist nach @proposition-durchschnitt-abg deren Durchschnitt auch abgeschlossen. Außerdem gilt klarerweise $S subset.eq sect cal(A)$. Sei nun $C subset.eq X$ eine beliebige abgeschlossene Menge mit $S subset.eq C$. Dann ist $C in cal(A)$ und aufgrund einer allgemeinen Tatsache über Durchschnitte gilt $C supset.eq sect cal(A)$, d.h. $sect cal(A)$ ist die kleinste Menge mit diesen Eigenschaften.
]

#proposition[
Eine Menge $S subset.eq X$ ist abgeschlossen genau dann wenn $S=overline(S)$.
]

#proof[
"$arrow.r.double$": Sei $S$ abgeschlossen, dann ist $S$ die kleinste abgeschlossene Menge, die $S$ enthält, d.h. $S = overline(S)$.\
"$arrow.l.double$": Sei $S=overline(S)$, dann ist $S$ nach Definition von $overline(S)$ abgeschlossen.
]

#definition("Konvergenz einer Folge")[
Sei $(X,cal(T))$ ein topologischer Raum, $(a_n)_(n in bb(N))$ eine Folge in X. Die Folge heißt *konvergent* gegen $a in X$, falls:
$ forall O in cal(T) "mit" a in O quad exists N in bb(N) quad forall n>N: quad a_n in O. $ In Worten: jede offene Menge, die $a$ enthält, enthält auch fast alle Folgenglieder $a_n$. Wir nennen $a$ einen *Grenzwert* der Folge $(a_n)_(n in bb(N))$ und schreiben $a_n -> a$.
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
Ein topologischer Raum $(X, cal(T))$ heißt *Hausdorffraum*, falls gilt: $ "Für alle" x,y in X "mit" x!=y "gibt es offene Umgebungen" U, V "von" x,y "mit" U sect V = emptyset. $
]

#theorem("Eindeutigkeit des Grenzwerts in Hausdorffräumen")[
Sei $(X,cal(T))$ ein Hausdorffraum. Dann sind Folgengrenzwerte eindeutig.
]

#proof[
Sei $(a_n)_(n in bb(N))$ eine Folge in $X$ mit $a_n -> a$. Angenommen $a_n -> b$, $a!=b$. Da $a_n -> a$, enthält eine beliebige offene Umgebung von $a$ fast alle Folgenglieder $a_n$. Da $(X,cal(T))$ Hausdorff ist, gibt es offene Umgebungen $U,V$ von $a,b$ mit $U sect V = emptyset$. $U$ enthält fast alle Folgenglieder von $(a_n)_(n in bb(N))$ und wegen $U sect V = emptyset$ kann $V$ nicht fast alle Folgenglieder von $(a_n)_(n in bb(N))$ enthalten. Das ist ein Widerspruch zu $a_n -> b$.
]

#remark[
Obiges Beispiel ist kein Hausdorffraum, da z.B. $0$ und $-1$ keine disjunkten Umgebungen haben.
]

#definition("Stetigkeit")[
Seien $(X, cal(T))$ und $(Y, cal(U))$ topologische Räume, $f:X arrow Y$ eine Funktion. Dann heißt $f$ *stetig im Punkt $x in X$*, falls für jede Umgebung $U subset.eq Y$ von $f(x)$ das Urbild $f^(-1)(U) subset.eq X$ eine Umgebung von $x$ ist.\
$f$ heißt *stetig*, falls $f$ in jedem Punkt $x in X$ stetig ist.
]

#proposition[
Seien $X$, $Y$ topologische Räume, $f:X arrow Y$ eine Abbildung. Dann sind folgende Aussagen äquivalent:
+ $f$ ist stetig,
+ Urbilder unter $f$ von offenen Mengen in $Y$ sind offen in $X$,
+ Urbilder unter $f$ von abgeschlossenen Mengen in $Y$ sind abgeschlossen in $X$.
]

#proof[
"1. $arrow.double$ 2.": Sei $f$ stetig, $O subset.eq Y$ offen. Nach @proposition-offen ist $O$ Umgebung jeder ihrer Punkte. Sei $y in O$ mit $y=f(x)$ für ein $x in X$. Da $f$ stetig, ist $f^(-1)(O)$ eine Umgebung von $x$. Da dies für alle $x$ mit $y=f(x) in O$ gilt, ist $f^(-1)(O)$ Umgebung jeder ihrer Punkte und somit offen. 

]