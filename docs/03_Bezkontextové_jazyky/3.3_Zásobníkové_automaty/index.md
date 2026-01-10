# 3.3 Zásobníkové automaty

<a id="def-zasobnik"></a>
!!! Definition "Definice (Zásobník)"

    ### Zásobník {#def-zasobnik}

    **Zásobník** je datová struktura, která s daty pracuje principem **LIFO** (last in, first out). V danou chvíli můžeme pracovat **pouze s daty na vrcholu zásobníku**, k čemuž nám slouží dvě operace:

    *   **push**: vloží data na vrchol zásobníku.
    *   **pop**: z vrcholu zásobníku data odstraňuje (např. `pop(b)` odstraní symbol a zkontroluje, že odstraňovaným symbolem je `b`).

!!! Implication "Intuice: Konečný vs. Zásobníkový automat"
    **Zásobníkový automat** (ZA) si můžeme představit jako konečný automat rozšířený o zásobník.
    
    *   **Konečný automat** si pamatuje informace pouze pomocí stavů (má konečnou paměť).
    *   **Zásobníkový automat** může k ukládání informací využít jak stavy, tak zásobník. Informací si tak může ukládat teoreticky nekonečně mnoho.

<a id="def-nza"></a>
!!! Definition "Definice (Nedeterministický zásobníkový automat)"

    ### Nedeterministický zásobníkový automat {#def-nza}

    **Nedeterministický zásobníkový automat** (NZA) definujeme jako uspořádanou sedmici $R = (Q, \Sigma, G, \delta, q_0, Z_0, F)$, kde:

    *   $Q$ je konečná neprázdná množina stavů,
    *   $\Sigma$ je konečná vstupní abeceda,
    *   $G$ je konečná neprázdná **abeceda zásobníku**,
    *   $\delta$ je přechodová funkce (zobrazení z $Q \times (\Sigma \cup \{\varepsilon\}) \times G$ do množiny konečných podmnožin množiny $Q \times G^*$),
    *   $q_0 \in Q$ je počáteční stav,
    *   $Z_0 \in G$ je **počáteční symbol na zásobníku** (na počátku zásobník není prázdný),
    *   $F \subseteq Q$ je množina koncových stavů.

    ![Zásobníkový automat](../../assets/03/zasobnikovy_automat_white.png#only-dark){ width="75%" }
    ![Zásobníkový automat](../../assets/03/zasobnikovy_automat_black.png#only-light){ width="75%" }

### Přechodová funkce a vizualizace

Definice přechodové funkce $\delta$ nám říká, že na základě aktuálního stavu, symbolu na vstupu (nebo $\varepsilon$) a symbolu na vrcholu zásobníku se rozhodneme, do kterých stavů půjdeme a jaký řetězec zapíšeme na vrchol zásobníku.

**Průběh přechodu:**

1. Z vrcholu zásobníku se **odstraní** čtený symbol (operace `pop`).

2. Čtecí hlava se posune o pozici vpravo (pokud nečteme $\varepsilon$).

3. Na vrchol zásobníku se **vloží** nový řetězec (operace `push`).


<a id="note-znazorneni-prechodu"></a>
!!! Implication "Možnosti znázornění přechodu"

    **1. Formální zápis**
    
    $$ \delta(S, a, b) = \{(A, c)\} $$
    
    *Význam:* Ze stavu $S$ na vstupní symbol `a` a symbol `b` na vrcholu zásobníku jdeme do stavu $A$, na vrchol zásobníku vložíme symbol `c` (předtím vyjmeme `b`).

    **2. Ohodnocený orientovaný graf**

    ![Stavový diagram](../../assets/03/stavový_diagram_white.png#only-dark)
    ![Stavový diagram](../../assets/03/stavový_diagram_black.png#only-light)
    
    Hrany jsou ohodnoceny trojicí `vstup, pop / push`.

!!! Warning "Pozor na orientaci zásobníku!"
    Protože jednotlivé položky na zásobníku jsou symboly a ne řetězce, musíme se při ukládání řetězců rozhodnout, v jakém pořadí je tam dáme.
    
    Pokud navrhujeme ZA pro zadaný jazyk, měli bychom uvést informaci, zdali je **vrchol zásobníku vlevo** (mapujeme první symbol řetězce), či **vpravo**. Ve většině případů (a v těchto skriptech) budeme pracovat s ZA s vrcholem zásobníku **vlevo**.

---

### Konfigurace a výpočet

<a id="def-konfigurace-za"></a>
!!! Definition "Definice (Konfigurace zásobníkového automatu)"

    ### Konfigurace zásobníkového automatu {#def-konfigurace-za}

    Nechť $R = (Q, \Sigma, G, \delta, q_0, Z_0, F)$ je zásobníkový automat. **Konfigurace** zásobníkového automatu $R$ je trojice $(q, w, \alpha) \in Q \times \Sigma^* \times G^*$.

    *   $q$ je aktuální stav,
    *   $w$ je dosud nezpracovaná část vstupního řetězce,
    *   $\alpha$ je obsah zásobníku.

    *   $(q_0, w, Z_0)$ je **počáteční konfigurace**.
    *   $(q, \varepsilon, \alpha)$, kde $q \in F$, je **přijímající konfigurace** (pro přijetí přechodem do koncového stavu).

Konfigurace popisuje kompletní stav výpočtu v daném okamžiku.

<a id="def-prechod-za"></a>
!!! Definition "Definice (Přechod v ZA)"

    ### Přechod v ZA (Krok výpočtu) {#def-prechod-za}

    Nechť $R = (Q, \Sigma, G, \delta, q_0, Z_0, F)$ je zásobníkový automat. Relaci přechodu $\vdash_R$ definujeme takto:

    $$
    (q, aw, \alpha\beta) \vdash_R (p, w, \gamma\beta) \iff (p, \gamma) \in \delta(q, a, \alpha)
    $$

    Kde $a \in \Sigma \cup \{\varepsilon\}, w \in \Sigma^*, \alpha, \beta, \gamma \in G^*$.
    
    *(Předpokládáme vrchol zásobníku vlevo).*

### Deterministický vs. Nedeterministický ZA

Zatímco u konečných automatů byly deterministické a nedeterministické varianty ekvivalentní, u zásobníkových automatů to **neplatí**.

*   **Nedeterministický ZA (NZA):** Rozpoznává množinu bezkontextových jazyků.
*   **Deterministický ZA (DZA):** Rozpoznává vlastní podmnožinu bezkontextových jazyků (větší než regulární, ale menší než všechny bezkontextové).

<a id="def-dza"></a>
!!! Definition "Definice (Deterministický zásobníkový automat)"

    ### Deterministický zásobníkový automat {#def-dza}

    ZA $R = (Q, \Sigma, G, \delta, q_0, Z_0, F)$ je **deterministický** (DZA), jestliže $\forall q \in Q \land \forall a \in \Sigma \cup \{\varepsilon\} \land \forall y, z \in G^*$:

    1.  $|\delta(q, a, z)| \le 1$
        *   Tj. pro každou kombinaci čteného vstupu a řetězce zásobníku má každý stav **nejvýše jeden** odchozí přechod.
    2.  Jestliže $\delta(q, a, z) \neq \emptyset \land \delta(q, a, y) \neq \emptyset$, pak $z$ není předponou $y$ (ani opačně).
        *   Tj. i když je na vstupu stejný symbol, nesmí nastat nejednoznačnost při výběru podle hloubky zásobníku.
    3.  Jestliže $\delta(q, a, z) \neq \emptyset \land \delta(q, \varepsilon, y) \neq \emptyset$, pak $z$ není předponou $y$ (ani opačně).
        *   Tj. nesmí nastat konflikt mezi čtením symbolu a $\varepsilon$-přechodem.

<a id="note-analyza-determinismu"></a>
!!! Implication "Analýza determinismu přechodů"

    Pojďme si rozebrat případy, kdy je automat deterministický a kdy ne:

    1.  **Liší se vstupním symbolem:**
        *   `a, ...` vs `b, ...` $\implies$ **Deterministické** (bez ohledu na zásobník).
        
        ![Čtení symbolu](../../assets/03/za_cteni1_white.png#only-dark){ width="75%" }
        ![Čtení symbolu](../../assets/03/za_cteni1_black.png#only-light){ width="75%" }

    2.  **Stejný vstupní symbol** (nebo konflikt s $\varepsilon$), záleží na zásobníku:
        *   Odebírají **stejný symbol/řetězec**: $\implies$ **Nedeterministické**.

        ![Čtení symbolu](../../assets/03/za_cteni2_white.png#only-dark){ width="75%" }
        ![Čtení symbolu](../../assets/03/za_cteni2_black.png#only-light){ width="75%" }

        *   Odebírají **různé symboly** (např. `a` vs `b`): $\implies$ **Deterministické**.

        ![Čtení symbolu](../../assets/03/za_cteni3_white.png#only-dark){ width="75%" }
        ![Čtení symbolu](../../assets/03/za_cteni3_black.png#only-light){ width="75%" }

        *   Odebírají **různé řetězce** (např. `ab` vs `a`):

            *   Pokud je jeden předponou druhého $\implies$ **Nedeterministické** (automat neví, zda číst dál).

            ![Čtení symbolu](../../assets/03/za_cteni4_white.png#only-dark){ width="75%" }
            ![Čtení symbolu](../../assets/03/za_cteni4_black.png#only-light){ width="75%" }

            *   Pokud není žádný předponou druhého $\implies$ **Deterministické**.

            ![Čtení symbolu](../../assets/03/za_cteni5_white.png#only-dark){ width="75%" }
            ![Čtení symbolu](../../assets/03/za_cteni5_black.png#only-light){ width="75%" }

---

### Jazyk přijímaný zásobníkovým automatem

Definujeme na základě typu přijetí. Tyto dva způsoby jsou **výpočetně ekvivalentní** (lze mezi nimi převádět).

1.  **ZA přijímající přechodem do koncového stavu:**
    Přijme, pokud přečte celý vstup a skončí ve stavu $q \in F$. (Obsah zásobníku není podstatný).
    
    $$ L(R) = \{ w \in \Sigma^* \mid \exists q \in F, \gamma \in G^* : (q_0, w, Z_0) \vdash_R^* (q, \varepsilon, \gamma) \} $$

2.  **ZA přijímající s prázdným zásobníkem:**
    Přijme, pokud přečte celý vstup a zásobník je prázdný. (Stav, ve kterém skončí, není podstatný).

    $$ L_\varepsilon(R) = \{ w \in \Sigma^* \mid \exists q \in Q : (q_0, w, Z_0) \vdash_R^* (q, \varepsilon, \varepsilon) \} $$

<a id="note-prijeti-neprijeti"></a>
!!! Implication "Kdy automat (ne)přijme vstupní řetězec?"

    **Deterministický ZA (DZA)**
    
    *   **Přijme:** Přečte celý řetězec a splní podmínku (koncový stav / prázdný zásobník).
    *   **Nepřijme:**
        *   Dojde k chybě (nedefinovaná přechodová funkce).
        *   Přečte řetězec, ale nesplní podmínku (skončí v nekoncovém stavu / zásobník není prázdný).

    **Nedeterministický ZA (NZA)**
    
    *   **Přijme:** Existuje **alespoň jedna** posloupnost přechodů, která vede k přečtení řetězce a splnění podmínky.
    *   **Nepřijme:** **Všechny** možné větve výpočtu skončí nepřijetím (zaseknutí, nedočtení vstupu, nesplnění podmínky).