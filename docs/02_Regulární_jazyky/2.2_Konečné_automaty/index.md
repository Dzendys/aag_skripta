# 2.2 Konečné automaty

Konečný automat (KA) je jednoduchý výpočetní model. Skládá se z **řídící jednotky** (stavy a přechodová funkce), **read-only vstupní pásky** rozdělené do buněk a **čtecí hlavy**, která čte jednotlivé symboly na pásce. Na počátku se automat nachází v počátečním stavu a čtecí hlava ukazuje na první symbol na pásce. V každém kroku automat přečte příslušný symbol a na základě něj a aktuálního stavu se přesune do stavu dalšího. Čtecí hlava se poté posune o jednu pozici vpravo na následující symbol a celý proces se opakuje, dokud jsou na vstupu nějaké nepřečtené symboly.

<a id="def-ka"></a>
!!! Definition "Definice (Konečný automat)"

    ### Konečný automat {#def-ka}

    Formálně definujeme konečný automat jako uspořádanou pětici $M = (Q, \Sigma, \delta, q_0, F)$, kde:

    * $Q$ je konečná neprázdná množina stavů,
    * $\Sigma$ je konečná vstupní abeceda,
    * $\delta$ je přechodová funkce (definice viz níže dle typu automatu),
    * $q_0 \in Q$ je počáteční stav,
    * $F \subseteq Q$ je množina koncových stavů.

    ![Konečný automat](../../assets/02/konecny_automat_white.png#only-dark){ width="75%" }
    ![Konečný automat](../../assets/02/konecny_automat_black.png#only-light){ width="75%" }

### Deterministický konečný automat (DKA)

Deterministický konečný automat je neformálně řečeno takový konečný automat, který má vždy jasně dáno, jak ve výpočtu pokračovat (nemůže si vybrat z více možností).

<a id="def-dka"></a>
!!! Definition "Definice (Deterministický konečný automat)"

    ### Deterministický konečný automat {#def-dka}

    DKA je konečný automat, kde přechodová funkce $\delta$ je zobrazení z množiny $Q \times \Sigma$ do množiny stavů $Q$.
    
    $$
    \delta : Q \times \Sigma \to Q
    $$

Přechodová funkce $\delta$ může být i **parciální**. To znamená, že $\delta$ není definována pro všechny dvojice stavů $q \in Q$ a vstupních symbolů $a \in \Sigma$. Pokud se automat dostane do situace, kdy pro daný stav a symbol na vstupu nemá definován přechod, vstup **nepřijme a skončí s chybou**.

Deterministický konečný automat, jenž má přechodovou funkci $\delta$ definovanou pro všechny dvojice stavů $q \in Q$ a vstupních symbolů $a \in \Sigma$, se nazývá **úplně určený DKA**.

### Nedeterministický konečný automat (NKA)

Nedeterministický konečný automat se vyznačuje tím, že si lze v nějaké fázi výpočtu vybrat, jak pokračovat.

<a id="def-nka"></a>
!!! Definition "Definice (Nedeterministický konečný automat)"

    ### Nedeterministický konečný automat {#def-nka}

    NKA je konečný automat, kde přechodová funkce $\delta$ je zobrazení z množiny $Q \times \Sigma$ do množiny všech podmnožin (potenční množiny) množiny $Q$.

    $$
    \delta : Q \times \Sigma \to \mathcal{P}(Q)
    $$

Tato definice říká, že se lze například ze stavu $q_1$ na symbol $a$ vydat do dvou různých následujících stavů $q_2$ a $q_3$ (automat si může vybrat). Výsledkem přechodové funkce $\delta$ u NKA může být pro nějaký stav a symbol též prázdná množina stavů.

Pokud u nedeterministického konečného automatu platí, že výsledkem přechodové funkce $\delta$ je pro všechny dvojice stavů $q \in Q$ a vstupních symbolů $a \in \Sigma$ neprázdná množina stavů, pak se tento automat nazývá **úplně určený NKA**.

**Rozšíření definice NKA:**

*   **NKA s $\varepsilon$-přechody:** Přechodovou funkci definujeme jako $\delta : Q \times (\Sigma \cup \{\varepsilon\}) \to \mathcal{P}(Q)$. Povolujeme takzvané $\varepsilon$-přechody, při kterých automat nečte žádný symbol (čtecí hlava se neposouvá) a pouze přejde do jiného stavu.
*   **NKA s více počátečními stavy:** Místo jednoho počátečního stavu zavedeme neprázdnou množinu počátečních stavů $I$.

Tato rozšíření nepřidávají automatu výpočetní sílu (lze je převést na základní NKA).

!!! Implication "Ekvivalence DKA a NKA"
    **Nedeterministický a deterministický konečný automat jsou co se týče výpočetní síly ekvivalentní.** Oba přijímají právě množinu regulárních jazyků. DKA je speciálním případem NKA a každý NKA lze převést na DKA.

---

### Znázornění konečného automatu

Znázornění se liší způsobem zápisu přechodové funkce $\delta$:

**1. Formální zápis**

*   (NKA) $\delta(S, 0) = \{S, A\}$
*   (DKA) $\delta(A, 0) = B$

**2. Ohodnocený orientovaný graf (stavový diagram)**

Vrcholy grafu reprezentují stavy (kolečko), dvojité kolečko označuje koncové stavy. Počáteční stav je označen příchozí hranou. Přechody mezi stavy jsou orientované hrany ohodnocené vstupními symboly.

![Stavový diagram](../../assets/02/stavovy_diagram_white.png#only-dark){ width="60%" }
![Stavový diagram](../../assets/02/stavovy_diagram_black.png#only-light){ width="60%" }

**3. Tabulka**

Sloupce odpovídají stavům, řádky symbolům abecedy. Počáteční stav označíme $\to$, koncový $\leftarrow$.

![Tabulka přechodů](../../assets/02/tabulka_prechodu_white.png#only-dark)
![Tabulka přechodů](../../assets/02/tabulka_prechodu_black.png#only-light)

*Poznámka:* U NKA vynecháváme množinové závorky. Prázdnou množinu (nebo nedefinovaný přechod u DKA) značíme prázdnou buňkou nebo pomlčkou.

<a id="def-homogenni-ka"></a>
!!! Definition "Definice (Homogenní konečný automat)"

    ### Homogenní konečný automat {#def-homogenni-ka}

    **Homogenní konečný automat** je takový konečný automat, kde pro každý stav platí, že všechny příchozí přechody jsou ohodnoceny stejným symbolem.

---

### Přijímání řetězců

!!! Implication "Kdy DKA (ne)přijme vstupní řetězec?"

    **DKA přijme** vstupní řetězec, pokud jej celý přečte a skončí v některém z koncových stavů.

    **DKA nepřijme** vstupní řetězec, pokud:

    * řetězec je celý přečten a automat skončí v nekoncovém stavu,
    * během čtení řetězce dojde k chybě (nedefinovaná přechodová funkce).

!!! Implication "Kdy NKA (ne)přijme vstupní řetězec?"

    **NKA přijme** vstupní řetězec, pokud v automatu existuje **alespoň jedna** posloupnost přechodů, kdy je přečten celý řetězec a výpočet skončí v některém z koncových stavů.

    **NKA nepřijme** vstupní řetězec, pokud neexistuje žádná posloupnost přechodů vedoucí k přijetí (všechny větve výpočtu skončí v nekoncovém stavu nebo zaseknutím).

<a id="def-jazyk-ka"></a>
!!! Definition "Definice (Jazyk přijímaný KA)"

    ### Jazyk přijímaný KA {#def-jazyk-ka}

    **Jazyk přijímaný konečným automatem** definujeme jako množinu všech řetězců, které automat přijímá.

    Dva konečné automaty nazveme **ekvivalentní** právě tehdy, když přijímají stejný jazyk.